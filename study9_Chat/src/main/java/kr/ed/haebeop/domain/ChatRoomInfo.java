package kr.ed.haebeop.domain;

import lombok.Data;


import java.util.List;

@Data
public class ChatRoomInfo {
    private String roomId;
    private String name;
    private List<String> users;

}

