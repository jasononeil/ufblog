package app.api;

import ufront.remoting.RemotingApiClass;
import ufront.auth.model.*;
import app.Permissions;
import ufront.ufadmin.UFAdminPermissions;
using tink.core.types.Outcome;

class SetupApi extends RemotingApiClass
{
	/**
		Create the `authors` and `admins` groups and set up permissions for those groups.
	**/
	public function setupGroups():Outcome<String,String> {
		
		var groupsAdded = [];
		try {
			var g = Group.manager.select( $name=="admins" );
			if ( null==g ) {
				g = new Group("admins");
				g.save();
				groupsAdded.push( 'authors' );
			}
			Permission.addPermission( g, CreateCategory );
			Permission.addPermission( g, CreateTag );
			Permission.addPermission( g, Post );
			Permission.addPermission( g, ModerateComments );
			Permission.addPermission( g, CanAccessAdminArea );

			var g = Group.manager.select( $name=="authors" );
			if ( null==g ) {
				g = new Group("authors");
				g.save();
				groupsAdded.push( 'admins' );
			}
			Permission.addPermission( g, CreateTag );
			Permission.addPermission( g, Post );
			Permission.addPermission( g, ModerateComments );

			return 'Success: added groups $groupsAdded'.asSuccess();
		}
		catch (e:Dynamic) {
			return 'Failure: $e.  Groups added: $groupsAdded'.asFailure();
		}
	}

	/**
		Set up a new user with the given name and password, and add them to set groups
	**/
	public function createUser( username:String, password:String, groups:Array<String> ) {
		try {
			var u = new User( username, password );
			u.save();

			for ( groupName in groups ) {
				var group = Group.manager.select( $name==groupName );
				if ( group!=null ) 
					u.groups.add( group );
			}

			return 'Set up $username with groups $groups successfully'.asSuccess();
		}
		catch (e:Dynamic) {
			return 'Failed to create user and set up groups: $e'.asFailure();
		}
	}
}