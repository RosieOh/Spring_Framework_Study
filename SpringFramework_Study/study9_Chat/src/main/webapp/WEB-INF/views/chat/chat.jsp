<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
</head>
<body>
<div id="contentWrap">
    <nav class="navbar is-primary">
        <div class="navbar-brand">
            <span class="navbar-item">
                Chat App
            </span>
        </div>
    </nav>
    <div class="columns" style="margin-top: 20px;">
        <div class="column is-one-quarter">
            <div class="box">
                <h3 class="title is-5">채팅방 만들기</h3>
                <div class="field">
                    <input class="input" type="text" id="roomName" placeholder="방 이름">
                </div>
                <div class="field">
                    <button class="button is-primary" id="createRoomButton">채팅방 생성</button>
                </div>
            </div>
            <div class="box">
                <h3 class="title is-5">채팅 방 목록</h3>
                <div id="roomSelect"></div>
            </div>
        </div>
        <div class="column is-half">
            <div class="box">
                <h3 class="title is-4" id="chatHeader">Everyone</h3>
                <div id="chatLog" class="has-background-white" style="height: 500px; overflow-y: auto;"></div>
                <div class="field" id="chatForm">
                    <input class="input" type="text" id="msg" aria-label="Recipient's username" aria-describedby="button-addon2" placeholder="메시지 입력">
                    <button class="button is-primary" type="button" id="button-send">전송</button>
                </div>
            </div>
        </div>
        <div class="column is-one-quarter">
            <div class="box">
                <h3 class="title is-5">사람</h3>
                <div id="memberSelect">
                    <c:if test="${loggedInUser != null}">
                        <div class="user">${loggedInUser.username}</div>
                    </c:if>
                </div>
                <div id="userList" class="content"></div> <!-- 사용자 목록을 표시할 곳 -->
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        var username = "guest";
        var currentRoomId = null;

        // 서버로부터 로그인한 사용자 정보를 가져와서 loggedInUser 변수에 할당
        $.ajax({
            type: "GET",
            url: "${path1}/api/getLoggedInUser",
            success: function (data) {
                if (data) {
                    loggedInUser = data;
                    username = loggedInUser.username;
                    $("#memberSelect").html("<div class='user'>" + username + "</div>");
                }
            }
        });

        $("#button-send").on("click", (e) => {
            send();
        });

        // 메시지 입력 필드에서 Enter 키를 눌렀을 때도 메시지 전송
        $("#msg").keypress(function(event) {
            if (event.which === 13) { // 13은 Enter 키의 키코드입니다.
                send();
            }
        });

        const websocket = new WebSocket("ws://localhost:8081/ws/chat");
        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = onClose;

        function send() {
            var msgInput = $("#msg"); // 메시지 입력 필드
            var messageText = msgInput.val(); // 입력된 메시지 가져오기

            // 입력된 메시지가 비어있으면 전송하지 않음
            if (!messageText) {
                return;
            }

            var message = username + ":" + messageText;

            // WebSocket을 통해 서버에 메시지 전송
            websocket.send(message);

            // 입력 필드 초기화
            msgInput.val("");

            // 메시지를 msgArea에 추가
            appendMessage(message);
        }

        // 화면에 메시지 추가하는 함수
        function appendMessage(message) {
            var chatArea = $("#chatLog");
            chatArea.append("<div class='msg2'><b>" + message + "</b></div><br>");
            // 화면에 스크롤을 최하단으로 이동시켜 새 메시지가 보이도록 함
            chatArea.scrollTop(chatArea[0].scrollHeight);
        }

        // 채팅방에서 나갔을 때
        function onClose(evt) {
            var str = username + ": 님이 방을 나가셨습니다.";
            websocket.send(str);
        }

        // 채팅방에 들어왔을 때
        function onOpen(evt) {
            if (currentRoomId) {
                // 현재 입장한 채팅방 정보를 보내기
                var enterMessage = "enterRoom:" + currentRoomId;
                websocket.send(enterMessage);
            }
        }

        // 메세지 전송
        function onMessage(msg) {
            var data = msg.data;

            // 데이터가 비어있는지 확인
            if (!data) {
                return;
            }

            var arr = data.split(":");

            // 데이터를 분할한 후, 배열의 길이를 확인하여 문제 해결
            if (arr.length < 2) {
                console.error("Invalid message format:", data);
                return;
            }

            var sessionId = arr[0];
            var message = arr.slice(1).join(":"); // ":"로 분할된 나머지 부분을 다시 결합

            // 나머지 코드는 변경하지 않음
            var cur_session = username;

            // 현재 세션에 로그인한 사람
            console.log("cur_session : " + cur_session);
            sessionId = arr[0];
            message = arr[1];

            console.log("sessionID : " + sessionId);
            console.log("cur_session : " + cur_session);

            // 로그인한 클라이언트와 다른 클라이언트를 분류하기 위함
            if (sessionId == cur_session) {
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-secondary'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#chatLog").append(str);
            } else {
                var str = "<div class='col-6'>";
                str += "<div class='alert alert-warning'>";
                str += "<b>" + sessionId + " : " + message + "</b>";
                str += "</div></div>";
                $("#chatLog").append(str);
            }
        }

        // 채팅방 생성 버튼 클릭 시
        $("#createRoomButton").click(function () {
            var roomName = $("#roomName").val(); // 입력된 채팅방 이름 가져오기

            // AJAX를 이용하여 ChatController의 createRoom API 호출
            $.ajax({
                type: "POST",
                url: "${path1}/chat/createRoom",
                data: { name: roomName }, // 파라미터로 채팅방 이름 전달
                success: function (data) {
                    // 채팅방 생성 성공 시 새로운 채팅방을 목록에 추가
                    $("#roomSelect").append("<div class='roomEl'><a href='#' class='joinRoom' data-roomid='" + data.roomId + "'>" + data.name + "</a></div>");
                    $("#roomName").val(""); // 입력 필드 초기화
                }
            });
        });

        // 채팅방 목록 불러오는 함수
        function loadChatRooms() {
            // AJAX를 이용하여 ChatController의 findAllRooms API 호출
            $.ajax({
                type: "GET",
                url: "${path1}/chat/allRoom",
                success: function (data) {
                    // 채팅방 목록을 표시
                    $("#roomSelect").empty(); // 목록 초기화
                    data.forEach(function (roomInfo) {
                        var roomElement = $("<div class='roomEl'></div>");
                        roomElement.append("<a href='#' class='joinRoom' data-roomid='" + roomInfo.roomId + "'>" + roomInfo.name + "</a>");

                        // 현재 채팅방에 참여한 사용자 목록을 추가로 표시
                        var usersElement = $("<div class='roomUsers'></div>");
                        roomInfo.users.forEach(function (user) {
                            usersElement.append("<div class='user'>" + user + "</div>");
                        });
                        roomElement.append(usersElement);

                        $("#roomSelect").append(roomElement);
                    });
                }
            });
        }

        // 사용자 목록 불러오는 함수
        function loadUsers() {
            $.ajax({
                type: "GET",
                url: "${path1}/chat/allUsers", // 사용자 목록을 반환하는 엔드포인트 URL로 변경해야 합니다.
                success: function (data) {
                    // 사용자 목록을 표시
                    $("#userList").empty(); // 목록 초기화
                    data.forEach(function (user) {
                        $("#userList").append("<div class='user'>" + user + "</div>");
                    });
                }
            });
        }

        // 페이지 로딩 시 사용자 목록 불러오기
        loadUsers();

        // 채팅방 목록 불러오기
        loadChatRooms();

        // 채팅방 입장 로직
        function enterChatRoom(roomId, roomName) {
            // 현재 입장한 채팅방 ID를 저장
            currentRoomId = roomId;

            // 채팅 헤더에 채팅방 이름 업데이트
            $("#chatHeader").text(roomName);

            // 기존 채팅 로그를 초기화
            $("#chatLog").empty();

            // 서버로 입장한 채팅방 정보를 보내기
            var enterMessage = "enterRoom:" + roomId;
            websocket.send(enterMessage);
        }

        // 채팅방 목록에서 채팅방에 입장할 때의 클릭 이벤트 핸들러
        $(document).on("click", ".joinRoom", function () {
            var roomId = $(this).data("roomid"); // 클릭한 방의 고유 ID 가져오기
            var roomName = $(this).text(); // 클릭한 방의 이름 가져오기

            // 채팅방에 입장
            enterChatRoom(roomId, roomName);
        });
    });
</script>
</body>
</html>
