       identification division.
       program-id. HELLCBL.
       environment division.
       data division.
       working-storage section.
       01 ws-msg                                   pic X(50).
       01 ws-padding                               pic X(15).
       01 ws-program-name                          pic X(15).
       01 ws-user.                                  
           02 user-name                            pic X(8).
           02 user-id                              pic 9(8).
           02 user-status                          pic A(1).
               88 user-active                      value "A".
               88 user-inactive                    value "I".
               88 user-hold                        value "H".
           02 user-bal                             pic 9999.99.
       01 ws-inp                                   pic X(50).
       
       procedure division.
       
       main-procedure.
           perform begin.
           perform display-message thru end-display-message.
           
       begin.
           move spaces to ws-msg, ws-user, ws-program-name.
           move zero to user-bal.
           move all "-" to ws-padding.
           move "Hello Cobol!" to ws-program-name.
           perform accept-data.
           
       accept-data.
           display "Enter username and id"
           accept ws-inp.
           unstring ws-inp delimited by space into 
               user-name, user-id, user-bal.

           if user-bal < 0 then
               move "I" to user-status
           else if user-bal > 9999.99 then
               move "H" to user-status
           else
               move "A" to user-status.

      *    accept ws-msg.

       display-message.
           display ws-padding ws-program-name ws-padding.
           display ws-program-name.
           display "Name: " user-name " Id: " user-id.

           if user-active then
               display "User is Active".
           if user-inactive then
               display "User is Inactive".
           
           display "Balance $" user-bal.
       

       end-display-message.
      *    write ws-user.
           stop run.
       end program HELLCBL.
