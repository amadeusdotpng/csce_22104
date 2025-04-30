architecture beh of Memory is
    type mem_type is array (0  to  31) of std_logic_vector(7  downto 0); -- changed!
    ...
    signal mem : mem_type := init_mem;
begin
    ...
end architecture beh;   
