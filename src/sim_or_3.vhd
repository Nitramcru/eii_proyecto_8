library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_or_3 is
end sim_or_3;

architecture sim of sim_or_3 is
  component or_3 is
    port (
      A : in  std_logic;
      B : in  std_logic;
      C : in  std_logic;
      Y : out std_logic
    );
  end component; -- or_3
  signal entrada : std_logic_vector (2 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : or_3 port map (
    A=>entrada(2),
    B=>entrada(1),
    C=>entrada(0),
    Y=>salida
    
    );

  excitaciones: process
  begin
    for i in 0 to 7 loop
      entrada <= std_logic_vector(to_unsigned(i,3));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
