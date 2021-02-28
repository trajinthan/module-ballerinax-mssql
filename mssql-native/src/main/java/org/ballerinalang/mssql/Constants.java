/*
 * Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.ballerinalang.mssql;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BString;

/**
 * Constants for mssql database client.
 */
final class Constants {
    static final class ClientConfiguration {
        static final BString HOST = StringUtils.fromString("host");
        static final BString PORT = StringUtils.fromString("port");
        static final BString USER = StringUtils.fromString("user");
        static final BString PASSWORD = StringUtils.fromString("password");
        static final BString DATABASE = StringUtils.fromString("database");
        static final BString OPTIONS = StringUtils.fromString("options");
        static final BString CONNECTION_POOL_OPTIONS = StringUtils.fromString("connectionPool");
    }


}