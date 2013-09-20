package app.controller;

import app.Errors;
import server.Server;
import ufront.web.Controller;

class BlogController
{
	public function new() {
		trace ("New blog controller");
	}

	public function doDefault( ?category:String, ?args:{ page:Int } ) {
		trace ("Do Default");
		var page = (args!=null) ? args.page : 0;
		if ( category==null ) {
			trace ("Homepage");
			return layout( 'Homepage', 'Page $page' );
		}
		else {
			trace ("Category");
			return layout( category, 'Page $page' );
		}
	}

	public function doTag( ?tag:String, ?args:{ page:Int } ) {
		var page = (args!=null) ? args.page : 0;
		if ( tag==null ) {
			return layout( 'Tags', 'List tags' );
		}
		else {
			return layout( '$tag', 'Show tag $tag' );
		}
	}

	public function doAuthor( ?author:String, ?args:{ page:Int } ) {
		var page = (args!=null) ? args.page : 0;
		if ( author==null ) {
			return layout( 'Authors', 'List authors P$page' );
		}
		else {
			return layout( author, 'Show author $author P$page' );
		}
	}

	function layout( title:String, content:String ) {
		var siteTitle = Config.app.title;
		var pageTitle = title;
		var menu = CompileTime.interpolateFile( "app/view/menu.html" );
		return CompileTime.interpolateFile( "app/view/layout.html" );
	}
}