package kr.ed.haebeop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/* pom.xml에서 지정한 multipart 넣기 */
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/* webapp/lib/cos.jar 넣기 */
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class FileUploadController {
    private static final Logger log = LoggerFactory.getLogger(FileUploadController.class);

    @GetMapping("/fileupload/fileUpload1")
    public String uploadForm1() {
        return "/fileupload/fileUpload1";
    }

    //이미지 업로드 처리 - com.oreilly.servlet.MultipartRequest
    @PostMapping("/fileupload/fileUpload1")
    public String upload1(HttpServletRequest request, HttpServletResponse response) {

        String uploadPath = "D:/oth/spring/springframework/study7/src/main/webapp/resources/upload";
        int maxFileSize = 1024 * 1024 * 10;
        String encType = "utf-8";

        MultipartRequest multi = null;

        try {
            multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());
            System.out.println(multi.getOriginalFileName("upload"));
            System.out.println(multi.getFilesystemName("upload"));

        } catch (IOException e) {
            System.out.println("[에러] " + e.getMessage());
        }

        return "redirect:/";
    }

    @GetMapping("/fileupload/fileUpload2")
    public String uploadForm2() {
        return "/fileupload/fileUpload2";
    }

    // 이미지 업로드 처리 - org.springframework.web.multipart.MultipartHttpServletRequest를 이용하는 경우
    @PostMapping("/fileupload/fileUpload2")
    public String upload1(MultipartHttpServletRequest multipartRequest) throws ServletException, IOException {
        List<MultipartFile> fileList = multipartRequest.getFiles("file");
        String uploadPath = "D:/oth/spring/springframework/study7/src/main/webapp/resources/upload";
        log.info("파일 개수 :" + fileList.size());
        for (MultipartFile multipartFile : fileList) {
            if (multipartFile.isEmpty()) {
                continue;
            }
            String uploadFilename = multipartFile.getOriginalFilename();
            log.info("업로드 파일 경로 및 이름 : " + uploadFilename);
            multipartFile.transferTo(new File(uploadPath, uploadFilename));
        } // for
        return "redirect:/";
    }

    @GetMapping("/fileupload/fileUpload3")
    public String uploadForm3() {
        return "/fileupload/fileUpload3";
    }

    @PostMapping("/fileupload/fileUpload3")  // 이미지 업로드 처리 - org.springframework.web.multipart.MultipartFile를 이용하는 경우
    public String upload3(HttpServletRequest request, RedirectAttributes rttr, List<MultipartFile> files) throws Exception {
        log.info("files 매개변수 : " + files);         //=========== 파일 업로드 작업 시작 ==============
        if (files != null) {
            log.info("업로드한 첨부파일 개수 : " + files.size());
        }
        ServletContext application = request.getSession().getServletContext();//현재 프로젝트 디렉토리를 상대경로로 설정
        String realPath = application.getRealPath("/resources/upload");
        log.info("realPath : " + realPath);
        File uploadPath = new File(realPath, getDateFolder()); //운영 서버 디렉토리에 폴더 동적 생성하기 /resources/upload/2023/10/06
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        } //운영 서버 디렉토리 생성
        for (MultipartFile multipartFile : files) {
            if (multipartFile.isEmpty()) {
                continue;
            }
            String uploadFilename = multipartFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            uploadFilename = uuid.toString() + "_" + uploadFilename;
            log.info("업로드 파일 경로 및 이름 : " + uploadFilename);
            multipartFile.transferTo(new File(uploadPath, uploadFilename)); // 운영 서버에 파일 업로드 수행
        }
        return "redirect:/";
    }

    private String getDateFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str;
    }

    @GetMapping("/fileupload/fileUpload4")
    public String uploadForm4() {
        return "/fileupload/fileUpload4";
    }

    @ResponseBody
    @PostMapping("/fileupload/fileUpload4")
    public List<String> upload4(MultipartHttpServletRequest multipartRequest) throws IllegalStateException, IOException {
        List<MultipartFile> fileList = multipartRequest.getFiles("file");
        List<String> fileNames = new ArrayList<String>();
        ServletContext application = multipartRequest.getSession().getServletContext();
        String realPath = application.getRealPath("/resources/upload");
        log.info("realPath : " + realPath);
        File uploadPath = new File(realPath);
        for (MultipartFile multipartFile : fileList) {
            if (multipartFile.isEmpty()) {
                continue;
            }
            String uploadFilename = multipartFile.getOriginalFilename();
            multipartFile.transferTo(new File(uploadPath, uploadFilename));
            fileNames.add(uploadFilename);
        }
        return fileNames;
    }

    // 파일 목록을 반환하는 컨트롤러 메서드
    @GetMapping("/fileupload/getFileList")
    public String getFileList(Model model) {
        List<String> fileList = getFileListFromServer(); // 파일 목록 가져오기
        model.addAttribute("fileList", fileList);
        return "/fileupload/getFileList";
    }

    // 서버에서 파일 목록을 가져오는 메서드
    private List<String> getFileListFromServer() {
        String uploadPath = "D:/oth/spring/springframework/study7/src/main/webapp/resources/upload";
        File uploadDir = new File(uploadPath);
        List<String> fileList = new ArrayList<>();

        if (uploadDir.exists() && uploadDir.isDirectory()) {
            File[] files = uploadDir.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        fileList.add(file.getName());
                    }
                }
            }
        }
        return fileList;
    }


    // 파일 목록을 반환하는 컨트롤러 메서드
    @GetMapping("/fileupload/deleteFileView")
    public String deleteFileView(Model model) {
        List<String> fileList = getFileListFromServer(); // 파일 목록 가져오기
        model.addAttribute("fileList", fileList); // 모델에 파일 목록 추가
        return "/fileupload/deleteFile";
    }

    // 파일 삭제 처리
    @PostMapping("/fileupload/deleteFile")
    public String deleteFile(@RequestParam("filename") String filename, RedirectAttributes redirectAttributes) {
        String result = deleteFileFromServer(filename); // 파일 삭제 처리
        if ("success".equals(result)) {
            redirectAttributes.addFlashAttribute("successMessage", "파일이 성공적으로 삭제되었습니다.");
        } else if ("error".equals(result)) {
            redirectAttributes.addFlashAttribute("errorMessage", "파일 삭제 중 오류가 발생했습니다.");
        } else if ("not_found".equals(result)) {
            redirectAttributes.addFlashAttribute("errorMessage", "삭제할 파일이 존재하지 않습니다.");
        }
        return "redirect:/fileupload/deleteFile"; // 파일 삭제 뷰로 리다이렉트
    }

    // 파일 삭제 기능
    private String deleteFileFromServer(String filename) {
        String uploadPath = "D:/oth/spring/springframework/study7/src/main/webapp/resources/upload";
        File fileToDelete = new File(uploadPath, filename);

        if (fileToDelete.exists()) {
            if (fileToDelete.delete()) {
                log.info("파일 삭제 성공 : " + filename);
                return "success";
            } else {
                log.error("파일 삭제 실패 : " + filename);
                return "error";
            }
        } else {
            log.warn("삭제할 파일이 존재하지 않음 : " + filename);
            return "not_found";
        }
    }


}
