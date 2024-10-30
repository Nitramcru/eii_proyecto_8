library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_FuncionCero is
end sim_FuncionCero;

architecture sim of sim_FuncionCero is
  component FuncionCero is
    port (
      entrada : in  std_logic_vector (31 downto 0);
      cero : out std_logic
    );
  end component; -- FuncionCero
  signal entradas : std_logic_vector (1 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : FuncionCero port map (A=>entradas(1),B=>entradas(0),Y=>salida);

  excitaciones: process
  begin
    for i in 0 to (2**entradas'length)-1 loop
      if (entrada = X"00000000" ) then
        cero <= '1';
      else
      cero <= '0';
      end if;
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
