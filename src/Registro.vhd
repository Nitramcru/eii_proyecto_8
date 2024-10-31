library IEEE;
use IEEE.std_logic_1164.all;

entity Registro is
  port (
    clk : in  std_logic;
    D : in  std_logic;
    Y : out std_logic
  );
end Registro;

architecture arch of Registro is
begin
  Y <= A and B;
end arch;
