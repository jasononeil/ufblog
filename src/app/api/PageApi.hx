package app.api;

// import haxe.io.Path;
// import sys.FileSystem;
// import sys.io.File;
// import ufront.auth.UserAuth;
import app.Errors;
// using tink.core.types.Outcome;
// using StringTools;

class PageApi extends ufront.remoting.RemotingApiClass
{
	// public function getPageContent( repo:String, file:String ):Outcome<String, PageError> {
		
	// 	// Read the file, and throw errors if we see them
	// 	repo = Path.addTrailingSlash( Config.app.repoDir ) + repo;
	// 	file = Path.addTrailingSlash( repo ) + file;
	// 	if ( !FileSystem.exists(file) ) return NotFound.asFailure();
	// 	try checkPathIsInside( file, repo ) catch (e:String) return SecurityError.asFailure();
	// 	var text = try File.getContent(file) catch (e:Dynamic) return CannotRead.asFailure();

	// 	// Depending on the extension, process the file
	// 	switch ( new Path(file).ext ) {
	// 		case "html":
	// 		case "md", "mdown", "markdown":
	// 			text = Markdown.markdownToHtml(text);
	// 		case "txt":
	// 			text = text.replace("\n", "\n<br />");
	// 		case _: 
	// 			throw UnknownType;
	// 	}

	// 	return text.asSuccess();
	// }

	// function checkPathIsInside( requestedPath:String, rootPath:String ) {
	// 	requestedPath = FileSystem.fullPath( requestedPath );
	// 	rootPath = FileSystem.fullPath( rootPath );
	// 	if ( !requestedPath.startsWith(rootPath) ) throw "No escaping!";
	// }
}

