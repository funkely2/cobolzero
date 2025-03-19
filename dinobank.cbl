       IDENTIFICATION DIVISION.
       PROGRAM-ID. DINOBANK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ACCOUNT-RECORD.
           05  ACCOUNT-NUMBER       PIC X(10).
           05  ACCOUNT-NAME         PIC X(30).
           05  ACCOUNT-BALANCE      PIC 9(10)V99.
       01  TRANSACTION-AMOUNT       PIC 9(10)V99.
       01  OPTION-SELECTED          PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Bienvenido a DINOBANK".
           DISPLAY "1. Deposito".
           DISPLAY "2. Retiro".
           DISPLAY "3. Consultar saldo".
           DISPLAY "4. Salir".
           ACCEPT OPTION-SELECTED.

           EVALUATE OPTION-SELECTED
               WHEN 1
                   PERFORM DEPOSIT-PROCEDURE
               WHEN 2
                   PERFORM WITHDRAW-PROCEDURE
               WHEN 3
                   PERFORM CHECK-BALANCE-PROCEDURE
               WHEN 4
                   DISPLAY "Gracias por usar DINOBANK. Adios!"
                   STOP RUN
               WHEN OTHER
                   DISPLAY "Invalida opcion. Intente denuevo."
                   PERFORM MAIN-PROCEDURE
           END-EVALUATE.

       DEPOSIT-PROCEDURE.
           DISPLAY "Ingrese el monto a depositar: "
           ACCEPT TRANSACTION-AMOUNT.
           ADD TRANSACTION-AMOUNT TO ACCOUNT-BALANCE.
           DISPLAY "Nuevo Saldo: " ACCOUNT-BALANCE.
           PERFORM MAIN-PROCEDURE.

       WITHDRAW-PROCEDURE.
           DISPLAY "Ingrese el monto a retirar: "
           ACCEPT TRANSACTION-AMOUNT.
           IF TRANSACTION-AMOUNT > ACCOUNT-BALANCE THEN
               DISPLAY "Saldo insuficiente."
           ELSE
               SUBTRACT TRANSACTION-AMOUNT FROM ACCOUNT-BALANCE
               DISPLAY "Nuevo Saldo: " ACCOUNT-BALANCE
           END-IF.
           PERFORM MAIN-PROCEDURE
