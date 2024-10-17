library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_and_2 is
end sim_and_2;

architecture sim of sim_and_2 is
  component and_2 is
    port (
      A : in  std_logic;
      B : in  std_logic;
      Y : out std_logic
    );
  end component; -- and_2
  signal AB : std_logic_vector (1 downto 0);
  signal Y : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : and_2 port map (A=>AB(1),B=>AB(0),Y=>Y);

  excitaciones: process
  begin
    for i in 0 to 3 loop
      AB <= std_logic_vector(to_unsigned(i,2));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
