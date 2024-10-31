library IEEE;
use IEEE.std_logic_1164.all;

entity Funcion_desplaza_der is
  port (
    A         : in  std_logic_vector (7 downto 0);
    B         : in  std_logic_vector (2 downto 0);
    con_signo : in std_logic;
    Y         : out std_logic_vector (7 downto 0)
  );
end Funcion_desplaza_der;

architecture arch of Funcion_desplaza_der is
  signal s32,s16,s8,s4,s2,s1 : std_logic_vector(7 downto 0);
  signal relleno  : std_logic_vector(3 downto 0);
  begin
     
   relleno <= (others =>A(31)) when con_signo else (others=> '0');
   
   s1  <= relleno (0 downto 0) &s2  (31 downto 1)  when B(0)  else s2;
   s2  <= relleno (1 downto 0) &s4  (31 downto 2)  when B(1)  else s4;
   s4  <= relleno (3 downto 0) &s8  (31 downto 4)  when B(2)  else s8;
   s8  <= relleno (3 downto 0) &s16 (31 downto 8)  when B(4)  else s16;
   s16 <= relleno (3 downto 0) &s32 (31 downto 16) when B(8)  else s32;
   s32 <= relleno (3 downto 0) &A   (31 downto )   when B(16) else A;
   
   Y <= S1;

   end arch;
