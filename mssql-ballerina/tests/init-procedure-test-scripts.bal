import ballerina/sql;

public function initProcedureTestScripts() {
    _ = createExactNumericProcedure();
    // _ = createCharacterProcedure();
}

public function createExactNumericProcedure() {
    sql:ParameterizedQuery numericProcedureCreationQuery = `
        alter procedure ExactNumericProcedure(
            row_id_in int,
            smallint_in smallint,
            int_in int,
            bigint_in bigint,
            decimal_in decimal(5,2),
            numeric_in numeric(10,5),
            bit_in  bit, 
            smallmoney_in smallmoney,
            tinyint_in tinyint,
            money_in money
            )   
            as 
            begin
                INSERT INTO NumericTypes2(
                    row_id INT PRIMARY KEY,
                    bigint_type  bigint,
                    numeric_type  numeric(10,5), 
                    bit_type  bit, 
                    smallint_type smallint, 
                    decimal_type decimal(5,2), 
                    smallmoney_type smallmoney,
                    int_type int,
                    tinyint_type tinyint,
                    money_type money
                    ) 
                VALUES (
                    row_id_in,
                    bigint_in,
                    numeric_in,
                    bit_in,
                    smallint_in,
                    decimal_in,
                    smallmoney_in,
                    int_in,
                    tinyint_in,
                    money_in
                    );
        end;
    `;
    _ = executeQuery("numeric_db", numericProcedureCreationQuery);
}

// public function createCharacterProcedure() {
//     sql:ParameterizedQuery characterProcedureCreationQuery = `
//         create or replace procedure CharacterProcedure(
//             row_id bigint,
//             char_in char(15),
//             varchar_in varchar(15),
//             text_in text,
//             name_in name
//             )
//             language plpgsql    
//             as $$
//             begin
//                 INSERT INTO CharacterTypes (row_id, char_type, varchar_type, text_type, name_type)
//                     VALUES(row_id, char_in, varchar_in, text_in, name_in);
//         end;$$  
//     `;
//     _ = executeQuery("character_db", characterProcedureCreationQuery);
// }