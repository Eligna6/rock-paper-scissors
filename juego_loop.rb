# Definir un hash para asociar los números con las opciones del juego
OPTIONS = {
  1 => "piedra",
  2 => "papel",
  3 => "tijera",
}

# Y un arreglo para definir comandos de salida comunes
EXIT_COMMANDS = ["no", "exit", "out"]

## FUNCIONES

# Función para desplegar mensaje de despedida
def say_farewell
  puts "Terminando el programa... Gracias por jugar, hasta la próxima. 👾"
end

# Función para obtener la opción del usuario
def get_user_choice
  user_choice = nil

  loop do
    puts "Escribe piedra, papel o tijera:"
    user_choice = $stdin.gets.chomp.downcase

    break if OPTIONS.values.include?(user_choice) || EXIT_COMMANDS.include?(user_choice)

    puts "Opción inválida: Debe ser piedra, papel o tijera."
  end

  user_choice
end

# Función para obtener la opción de la computadora
def get_computer_choice
  Random.rand(1..3)
end

# Función para mostrar las opciones elegidas
def show_choices(user_choice, computer_choice)
  puts "Usuario eligió #{user_choice}."
  puts "Computadora eligió #{OPTIONS[computer_choice]}."
end

# Función para comparar las opciones y determinar el ganador
def get_winner(user_choice, computer_choice)
  if user_choice == OPTIONS[computer_choice]
    "Empate 🤝"
  elsif (user_choice == "piedra" && OPTIONS[computer_choice] == "tijera") ||
        (user_choice == "papel" && OPTIONS[computer_choice] == "piedra") ||
        (user_choice == "tijera" && OPTIONS[computer_choice] == "papel")
    "Ganaste 🎉"
  else
    "Perdiste 🎻"
  end
end

## GAME LOOP
loop do
  user_choice = get_user_choice

  break if EXIT_COMMANDS.include?(user_choice)

  computer_choice = get_computer_choice
  show_choices(user_choice, computer_choice)
  puts get_winner(user_choice, computer_choice)

  puts "¿Quieres jugar de nuevo? (S/N)"
  answer = $stdin.gets.chomp.downcase

  break unless answer == "s"
end

say_farewell
