// CreatorView.java
package scape.creator;

import java.util.List;
import scape.room.RoomDTO;

public class CreatorView {

    public static void display(String message) {
        System.out.println("[개발자 알림] " + message);
    }

    public static void displayUnassignedRooms(List<RoomDTO> rooms) {
        if (rooms == null || rooms.isEmpty()) {
            System.out.println("배정 요청 가능한 방이 없습니다.");
        } else {
            System.out.println("=== 매장 배정 요청 가능한 내 방 리스트 ===");
            for (RoomDTO room : rooms) {
                System.out.println("- 방 이름: " + room.getROOM_NAME()
                                 + " | 장르: " + room.getGENRE()
                                 + " | 시놉시스: " + room.getSYNOPSIS());
                String hope = room.getHOPE_STORE();
                String status = room.getSTORE_STATUS();

                if (status != null && !status.isBlank()) {
                    System.out.println("※ 현재 매장 배정 상태: " + status);
                }
                if (hope != null && !hope.isBlank()) {
                    System.out.println("※ 현재 매장 희망 위치: " + hope);
                }
                System.out.println("--------------------------------------------------");
            }
        }
    }

    public static void displayRooms(List<RoomDTO> rooms) {
        if (rooms == null || rooms.isEmpty()) {
            System.out.println("등록된 방이 없습니다.");
        } else {
            System.out.println("==== 내가 만든 방 리스트 ====");
            for (RoomDTO room : rooms) {
                String is19Text = room.getIS_19() == 1 ? "예" : "아니오";
                String storeLoc = room.getSTORE_UNIQUE_ID() != null ? room.getSTORE_UNIQUE_ID() : "위치 없음";

                System.out.printf("방탈출 이름: %s | 장르: %s | 19금: %s | 가격: %d원 | 제한시간: %d분 | 매장 위치: %s%n",
                        room.getROOM_NAME(),
                        room.getGENRE(),
                        is19Text,
                        room.getPRICE(),
                        room.getLIMIT_TIME(),
                        storeLoc);

                System.out.println("시놉시스: " + room.getSYNOPSIS());
                System.out.println("--------------------------------------------------");
            }
        }
    }

}