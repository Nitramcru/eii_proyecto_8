library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_FuncionCero is
end sim_FuncionCero;

architecture sim of sim_FuncionCero is
  component FuncionCero is
    port (
      A : in  std_logic_vector (31 downto 0);
      Z : out std_logic
    );
  end component; -- FuncionCero
  signal A : std_logic_vector (31 downto 0);
  signal Z : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : FuncionCero port map (A=>A,Z=>Z);

  estimulo: process
    variable aleatoria: aleatoria_t;
  begin
    A<= (others =>'0')
    wait for 1ns;

    for i in 0 to 99 loop
      A <= aleatoria.genera_vector(32);
      wait for 1ns;
    end loop;
    
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
