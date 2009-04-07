%%%
%% auth_couchdb_test.erl
%%

-include_lib("eunit/include/eunit.hrl").

-module(auth_couchdb_test).


starttest() ->
    application:start(inets), %% may already be loaded
    application:set_env(ecouch, host, "127.0.0.1"),
    application:set_env(ecouch, port, "5984"),
    application:set_env(ecouch, user, none),
    application:set_env(ecouch, pass, none),
    ok = application:start(ecouch),
    sha:start(),
    ok.

stoptest() ->
    application:stop(inets),
    application:stop(ecouch),
    sha:stop(),
    ok.

ejabberd_auth_couchdb_test() ->
    ok.


ejabberd_auth_couchdb_check_password_test() ->
    starttest(),
    true = ejabberd_auth_couchdb:check_password("tofu","localhost","test"),
    stoptest().
    
