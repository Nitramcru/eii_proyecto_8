library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_FuncionOR is
end sim_FuncionOR;

architecture sim of sim_FuncionOR is
  component FuncionOR is
    port (
      A : in  std_logic_vector (31 downto 0);
      Z : out std_logic
    );
  end component; -- FuncionOR
  signal A : std_logic_vector (31 downto 0);
  signal Z : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : FuncionOR port map (A=>entradas(1),B=>entradas(0),Y=>salida);

  estimulo: process
  variable aleatoria: aleatoria_t;
  begin
    for i in 0 to 99 loop
      A <= aleatoria.genera_vector(32);
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
