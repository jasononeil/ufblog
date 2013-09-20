package app;

import clientds.ClientDsApi;
import ufront.remoting.RemotingApiContext;

import app.api.PageApi;

/** Seems to require explicit imports... */
class Api extends RemotingApiContext
{
	// App specific
	public var pageApi:PageApi;

	// Vendor
	public var clientDsApi:ClientDsApi;
}