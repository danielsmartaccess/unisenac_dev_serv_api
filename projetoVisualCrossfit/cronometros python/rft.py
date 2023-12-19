import time
import os

def clear_screen():
    """ Limpa a tela do console. """
    os.system('cls' if os.name == 'nt' else 'clear')

def display_timer(seconds):
    """ Mostra o tempo decorrido no formato HH:MM:SS. """
    hours, remainder = divmod(seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    time_format = '{:02d}:{:02d}:{:02d}'.format(hours, minutes, seconds)
    print(time_format, end='\r')

def rft_timer(num_rounds):
    """ Executa o cronômetro RFT. """
    round_times = []
    start_time = time.time()
    print("Pressione Enter para começar e concluir cada rodada.")
    input("Pronto? ")

    for round in range(1, num_rounds + 1):
        input(f"\nPressione Enter para concluir a rodada {round}: ")
        current_time = int(time.time() - start_time)
        round_times.append(current_time)
        clear_screen()
        print(f"Tempo da Rodada {round}: ", end='')
        display_timer(current_time)

    total_time = int(time.time() - start_time)
    clear_screen()
    print("Tempos de cada rodada:")
    for round, time_elapsed in enumerate(round_times, 1):
        print(f"Rodada {round}: ", end='')
        display_timer(time_elapsed)
        print()

    print("\nTempo total do RFT: ", end='')
    display_timer(total_time)
    print("\nTreino concluído!")

def main():
    try:
        num_rounds = int(input("Digite o número de rodadas do RFT: "))
        rft_timer(num_rounds)
    except ValueError:
        print("Por favor, insira um número válido.")

if __name__ == "__main__":
    main()
