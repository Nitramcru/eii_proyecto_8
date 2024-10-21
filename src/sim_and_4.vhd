library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_and_4 is
end sim_and_4;

architecture sim of sim_and_4 is
  component and_4 is
    port (
      A : in  std_logic;
      B : in  std_logic;
      C : in  std_logic;
      D : in  std_logic;
      Y : out std_logic
    );
  end component; -- and_4
  signal entradas : std_logic_vector (3 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : and_4 port map (
    A=>entradas(3),
    B=>entradas(2),
    C=>entradas(1),
    D=>entradas(0),
    Y=>salida
  );

  excitaciones: process
  begin
    for i in 0 to 15 loop
      entradas <= std_logic_vector(to_unsigned(i,4));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
