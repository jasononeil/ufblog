package tasks;

import app.api.SetupApi;
import ufront.tasks.TaskSet;
import haxe.web.Dispatch;
import ufront.auth.model.*;
import sys.FileSystem;
import tasks.*;

class Tasks extends TaskSet
{
	@help("Set up admin user and optionally initial seed data") 
	function doInitialSetup( adminUser:String, adminPass:String, ?loadSeedData=true ) {
		var api = new SetupApi();
		api.setupGroups();
		switch api.createUser( adminUser, adminPass, ["admins","authors"] ) {
			case Success(s): 
				trace(s);
				Sys.exit(0);
			case Failure(s): 
				trace(s);
				Sys.exit(1);
		}
	}

	// @help("Do a git `clone` or `pull` to get the latest copies of our pages")
	// function doGetrepos() {
	// 	var dir = Config.app.repoDir;

	// 	if ( !FileSystem.exists(dir) ) 
	// 		FileSystem.createDirectory( dir ); 
			
	// 	Sys.setCwd( dir );
	// 	for ( repo in Config.app.repos ) {
	// 		Sys.println( repo.name+":" );
	// 		if ( FileSystem.exists( repo.name ) ) {
	// 			Sys.setCwd( repo.name );
	// 			Sys.command( "git", ["pull"] );
	// 			Sys.setCwd( ".." );
	// 		}
	// 		else
	// 			Sys.command( "git", ["clone",repo.url,repo.name] );
	// 	}

	// 	Sys.println( "Finished" );
	// }

	static function main() {
		sys.db.Manager.cnx = sys.db.Mysql.connect( Config.db );
		TaskSet.run( new Tasks(), Sys.args() );
	}
}