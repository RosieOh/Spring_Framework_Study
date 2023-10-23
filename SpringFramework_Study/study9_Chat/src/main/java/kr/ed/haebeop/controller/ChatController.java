package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.ChatRoom;
import kr.ed.haebeop.domain.ChatRoomInfo;
import kr.ed.haebeop.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/chat/")
public class ChatController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private final ChatService service;

    @GetMapping("home")
    public String loadHome(Model model){
        // return "/chat/home"; // 내가 만든거
        return "/chat/chat"; // 강사님이 만든거
    }

    @PostMapping("createRoom")
    @ResponseBody
    public ChatRoom createRoom(@RequestParam String name){
        logger.info("createRoom Start");
        return service.createRoom(name);
    }

    @GetMapping("allRoom")
    @ResponseBody
    public List<ChatRoomInfo> findAllRooms() {
        List<ChatRoom> chatRooms = service.findAllRoom();

        // ChatRoomInfo는 채팅방 정보와 사용자 목록을 함께 담을 클래스입니다.
        List<ChatRoomInfo> roomInfoList = new ArrayList<>();

        for (ChatRoom chatRoom : chatRooms) {
            ChatRoomInfo roomInfo = new ChatRoomInfo();
            roomInfo.setRoomId(chatRoom.getRoomId());
            roomInfo.setName(chatRoom.getName());

            // 현재 채팅방에 참여한 사용자 목록을 가져옵니다.
            List<String> roomUsers = service.getRoomUsers(chatRoom.getRoomId());
            roomInfo.setUsers(roomUsers);

            roomInfoList.add(roomInfo);
        }

        return roomInfoList;
    }


}