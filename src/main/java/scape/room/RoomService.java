package scape.room;

import java.util.List;

import scape.store.StoreDAO;

public class RoomService {
    private final RoomDAO roomdao = new RoomDAO();

    // 방 목록 조회 (개발자 ID 기준)
    public List<RoomDTO> getRoomsByCreator(String creatorId) {
        return roomdao.findRoomsByCreator(creatorId);
    }
    
    // 내 방 중 매장 미배정된 방 조회
    public List<RoomDTO> getUnassignedRooms(String creatorId) {
        return roomdao.findUnassignedRooms(creatorId);
    }
    

    // 방 생성
    public boolean createRoom(RoomDTO room) {
        return roomdao.insertRoom(room);
    }

    // 방 삭제
    public boolean deleteRoom(String roomId, String creatorId) {
        return roomdao.deleteRoomByCreator(roomId, creatorId);
    }

    // 방 배정 요청
    public boolean requestAssignment(String roomId, String creatorId, String hopeStore) {
        return roomdao.updateRoomRequest(roomId, creatorId, hopeStore);
    }
	 //매장 위치 소환
    public List<String> getAvailableStoreLocations() {
        return new StoreDAO().getAllLocations();
    }
    
    //bosscontroller에서 사용하는 rjtemf
    public List<RoomDTO> getPendingRooms() {
        return roomdao.findRoomsByStatus("대기중");
    }

    public int getRoomCountInStore(String hopeStore) {
        return roomdao.countRoomsInStore(hopeStore);
    }

    public void updateRoomStatus(String roomId, String status) {
        roomdao.updateStoreStatus(roomId, status);
    }

    public void approveRoom(String roomId, String storeUniqueId) {
        roomdao.assignStoreToRoom(roomId, storeUniqueId);
    }
    
    //해당 매장 테마찾기
    public List<String> getTop3ThemesByLocation(String location) {
        return new RoomDAO().getTop3RoomNamesByLocation(location);
    }

}
