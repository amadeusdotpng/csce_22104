entity Memory is
   generic (
       INPUT : string := "instr.txt"; -- changed!
       OUTPUT : string := "out.txt"
   );
    port ( ... );
end entity Memory;
