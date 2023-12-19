import time
import os
import keyboard

def clear_screen():
    """ Limpa a tela do console. """
    os.system('cls' if os.name == 'nt' else 'clear')

def display_timer(seconds):
    """ Mostra o tempo decorrido no formato HH:MM:SS. """
    hours, remainder = divmod(seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    time_format = '{:02d}:{:02d}:{:02d}'.format(hours, minutes, seconds)
    print(time_format, end='\r')

def for_time_timer():
    """ Executa o cronômetro For Time. """
    print("Pressione Enter para começar e qualquer outra tecla para parar.")
    input("Pronto? ")
    start_time = time.time()
    try:
        while True:
            clear_screen()
            elapsed_time = int(time.time() - start_time)
            display_timer(elapsed_time)
            time.sleep(1)
            if keyboard.is_pressed('esc'):  # Pode escolher outra tecla se desejar
                break
    except KeyboardInterrupt:
        pass  # Opcional, dependendo de como você quer lidar com Ctrl+C
    finally:
        elapsed_time = int(time.time() - start_time)
        clear_screen()
        print("Tempo total: ", end='')
        display_timer(elapsed_time)
        print("\nTreino concluído!")

def main():
    for_time_timer()

if __name__ == "__main__":
    main()
