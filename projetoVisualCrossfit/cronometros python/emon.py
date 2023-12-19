#EMOM (Every Minute on the Minute): Aqui, os atletas têm um minuto para completar um número específico de repetições de um exercício. O tempo restante do minuto é usado para descansar antes do próximo minuto começar. Este ciclo continua por um período de tempo predefinido.
import time
import os

# Importando winsound no Windows, ou definindo uma função alternativa em outros sistemas
try:
    import winsound
    def beep():
        winsound.Beep(1000, 500)  # Frequência em Hz, duração em ms
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

def emom_timer(duration):
    """ Executa o cronômetro EMOM. """
    for minute in range(duration):
        for second in range(60, 0, -1):
            clear_screen()
            display_timer(second)
            time.sleep(1)
        beep()  # Emitir um aviso sonoro no início de cada novo minuto
        print("\nInício do minuto:", minute + 1)

    print("\nEMOM completo!")

def main():
    try:
        duration = int(input("Digite a duração total do EMOM em minutos: "))
        emom_timer(duration)
    except ValueError:
        print("Por favor, insira um número válido.")

if __name__ == "__main__":
    main()
