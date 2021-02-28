// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.

// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/crypto;
import ballerina/java;
import ballerina/sql;

public client class Client{

    # Initialize mssql Client.
    #
    # + user - Name of a user of the database
    # + password - Password for the user
    # + database - System Identifier or the Service Name of the database
    # + host - Hostname of the mssql server to be connected
    # + port - Port number of the mssql server to be connected
    # + options - Mssql database specific JDBC options
    # + connectionPool - The `sql:ConnectionPool` object to be used within 
    #         the jdbc client. If there is no connectionPool provided, 
    #         the global connection pool will be used
    public function init(
        string user,
        string password,
        string host = "localhost",
        int port,
        string database =,
        Options? options = (),
        sql:ConnectionPool?  connectionPool = ()
    ) returns sql:Error? {
        ClientConfiguration clientConfig = {
            user: user,
            password: password,
            host: host,
            port: port,
            database: database,
            options: options,
            connectionPool: connectionPool
        };
        return createClient(self, clientConfig, sql:getGlobalConnectionPool());
    }

}

function createClient(Client 'client, ClientConfiguration clientConfig, sql:ConnectionPool globalConnPool) returns sql:Error? = @java:Method{
    'class: "org.ballerinalang.mssql.NativeImpl"
} external;
