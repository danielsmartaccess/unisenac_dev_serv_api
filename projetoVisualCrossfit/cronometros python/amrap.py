# MRAP (As Many Rounds/Reps As Possible): Neste formato, o objetivo é completar tantas rodadas ou repetições quanto possível dentro de um período de tempo determinado. Por exemplo, um treino AMRAP de 20 minutos onde o atleta tenta fazer o máximo de rodadas possíveis de um conjunto de exercícios."""
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

def display_timer(time_left):
    """ Mostra o tempo restante no formato MM:SS. """
    mins, secs = divmod(time_left, 60)
    time_format = '{:02d}:{:02d}'.format(mins, secs)
    print(time_format, end='\r')

def amrap_timer(duration):
    """ Executa o cronômetro AMRAP com avisos sonoros. """
    time_left = duration * 60  # Convertendo minutos para segundos
    while time_left:
        clear_screen()
        display_timer(time_left)
        # Emitir um aviso sonoro nos primeiros 5 segundos e nos últimos 3 segundos
        if time_left <= 3 or time_left >= duration * 60 - 5:
            beep()
        time.sleep(1)
        time_left -= 1
    print("\nTempo esgotado!")
    main()

def main():
    try:
        duration = int(input("Digite a duração do AMRAP em minutos: "))
        amrap_timer(duration)
    except ValueError:
        print("Por favor, insira um número válido.")

if __name__ == "__main__":
