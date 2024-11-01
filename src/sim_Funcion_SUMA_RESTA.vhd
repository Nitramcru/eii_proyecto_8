library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_Funcion_SUMA_RESTA is
end sim_Funcion_SUMA_RESTA;

architecture sim of sim_Funcion_SUMA_RESTA is
  component Funcion_SUMA_RESTA is
    port (
      A : in  std_logic_vector (31 downto 0);
      B : in  std_logic_vector (31 downto 0);
      resta: in std_logic;

      Y : out std_logic_vector (31 downto 0)
    );
  end component; -- Funcion_SUMA_RESTA

  signal A, B, Y : std_logic_vector (31 downto 0);
  signal resta : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : Funcion_SUMA_RESTA port map (A=>A, B=>B, resta=>resta, Y=>Y);

  estimulo: process
    variable aleatoria: aleatoria_t;
  begin
    
    for i in 0 to 99 loop
      A <= aleatorio.genera_vector (32);
      B <= aleatorio.genera_vector (32);
      
      resta <= aleatoria.genera_bit;

      wait for 1 ns;
    
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
