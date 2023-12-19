import time
import os

# Importando winsound no Windows, ou definindo uma função alternativa em outros sistemas
try:
    import winsound
    def beep():
        winsound.Beep(800, 500)  # Frequência em Hz, duração em ms
except ImportError:
    def beep():
        os.system('echo -n "\a"')  # Emitir beep no terminal

def clear_screen():
    """ Limpa a tela do console. """
    os.system('cls' if os.name == 'nt' else 'clear')

def display_timer(seconds):
    """ Mostra o tempo restante no formato SS. """
    time_format = '{:02d}'.format(seconds)
    print(time_format, end='\r')

def get_input(prompt, default):
    """ Obtém um valor inteiro do usuário, com um valor padrão. """
    while True:
        try:
            return int(input(prompt) or default)
        except ValueError:
            print("Por favor, insira um número inteiro válido.")

def tabata_timer():
    """ Executa o cronômetro Tabata. """
    rounds = get_input("Digite o número de rodadas (padrão 8): ", 8)
    work_time = get_input("Digite o tempo de exercício em segundos (padrão 20): ", 20)
    rest_time = get_input("Digite o tempo de descanso em segundos (padrão 10): ", 10)

    for round in range(1, rounds + 1):
        print(f"\nRodada {round} - Exercício")
        beep()  # Aviso sonoro para começar
        for second in range(work_time, 0, -1):
            clear_screen()
            display_timer(second)
            time.sleep(1)

        print(f"\nRodada {round} - Descanso")
        beep()  # Aviso sonoro para descansar
        for second in range(rest_time, 0, -1):
            clear_screen()
            display_timer(second)
            time.sleep(1)

    beep()  # Aviso sonoro para o final
    print("\nTabata completo!")

def main():
    tabata_timer()

if __name__ == "__main__":
    main()
