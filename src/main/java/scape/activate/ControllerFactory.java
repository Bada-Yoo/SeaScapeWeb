package scape.activate;

import scape.boss.BossController;
import scape.creator.CreatorController;
import scape.store.StoreController;
import scape.users.UsersController;

public class ControllerFactory {

	public static ActivateControllerInterface make(String business) {
		ActivateControllerInterface controller = null;
		
		switch (business) {
		  case "users"->{controller = new UsersController();}  
		  case "creator"->{controller = new CreatorController();}
		  case "store"->{controller = new StoreController();}
		  case "boss"->{controller = new BossController();}
		}
		
		
		return controller;
	}


}
