// Carrega os exercícios do servidor quando a página é carregada
document.addEventListener('DOMContentLoaded', () => {
    fetchExercicios();
});



// Adiciona evento de clique ao botão de iniciar o cronômetro Tabata
document.getElementById('startTabataButton').addEventListener('click', startTabataTimer);

// Variável para controlar o estado de pausa
let isPaused = false;

// Adiciona evento de clique ao botão de pausar o cronômetro Tabata
document.getElementById('pauseTabataButton').addEventListener('click', togglePause);

// Função para buscar exercícios do servidor e exibir como checkboxes
function fetchExercicios() {
    fetch('http://localhost:3001/exercicios') // Substitua pela URL do seu endpoint
        .then(response => response.json())
        .then(exercicios => {
            const container = document.getElementById('exercicios-container');
            exercicios.forEach(exercicio => {
                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.id = exercicio.id;
                checkbox.value = exercicio.nome;

                const label = document.createElement('label');
                label.htmlFor = exercicio.id;
                label.textContent = exercicio.nome;

                container.appendChild(checkbox);
                container.appendChild(label);
                container.appendChild(document.createElement('br'));
            });
        })
        .catch(error => console.error('Erro ao buscar exercícios:', error));
}

// Função para alternar o estado de pausa
function togglePause() {
    isPaused = !isPaused;
    document.getElementById('pauseButton').textContent = isPaused ? 'Continuar' : 'Pausar';
}

// Função para gerar um som de beep
function beep(frequency, duration) {
    const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    const oscillator = audioContext.createOscillator();
    const gainNode = audioContext.createGain();

    oscillator.connect(gainNode);
    gainNode.connect(audioContext.destination);
    oscillator.frequency.value = frequency;
    gainNode.gain.setValueAtTime(0, audioContext.currentTime);
    gainNode.gain.linearRampToValueAtTime(1, audioContext.currentTime + 0.01);
    oscillator.start(audioContext.currentTime);
    gainNode.gain.exponentialRampToValueAtTime(0.001, audioContext.currentTime + (duration / 1000));
    oscillator.stop(audioContext.currentTime + (duration / 1000));
}

// Função para exibir o temporizador na tela
function displayTimer(seconds, isRestPeriod) {
    const timerDisplay = document.getElementById('timer-display');
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;
    timerDisplay.innerText = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    timerDisplay.style.color = isRestPeriod ? 'green' : 'red';
}

// Função para atualizar o display de rodadas
function updateRoundDisplay(currentRound, totalRounds) {
    const roundDisplay = document.getElementById('round-display');
    roundDisplay.innerText = `Round: ${currentRound} de ${totalRounds}`;
}

// Função para controlar cada rodada do Tabata (tempo de exercício e descanso)
async function startRound(duration, isRestPeriod) {
    for (let second = duration; second > 0; second--) {
        while (isPaused) {
            await new Promise(resolve => setTimeout(resolve, 1000));
        }

        displayTimer(second, isRestPeriod);
        if (isRestPeriod) {
            beep(300, 1000); // Aviso sonoro durante o tempo de descanso
        } else if (second === duration) {
            beep(1000, 3000); // Aviso sonoro de 3 segundos no início do exercício
        } else if (second <= 5) {
            beep(800, 1000); // Aviso sonoro nos últimos 5 segundos do exercício
        }
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
}

// Função para iniciar o cronômetro Tabata
async function startTabataTimer() {
    document.getElementById('pauseTabataButton').disabled = false;

    const selectedExercises = getSelectedExercises();
    const exerciseDisplay = document.getElementById('exercise-display');
    exerciseDisplay.innerText = 'Exercícios Selecionados: ' + selectedExercises.join(', ');

    const rounds = parseInt(document.getElementById('rounds').value);
    const workTime = parseInt(document.getElementById('workTime').value);
    const restTime = parseInt(document.getElementById('restTime').value);

    for (let round = 1; round <= rounds; round++) {
        updateRoundDisplay(round, rounds);
        await startRound(workTime, false); // Tempo de exercício
        await startRound(restTime, true);  // Tempo de descanso
    }

    beep(800, 300); // Aviso sonoro de término do Tabata
    alert("Tabata completo!");
    updateRoundDisplay(0, rounds);
    document.getElementById('pauseButton').disabled = true;
}

// Função para obter os exercícios selecionados
function getSelectedExercises() {
    const selected = [];
    document.querySelectorAll('#exercicios-container input[type="checkbox"]:checked').forEach(checkbox => {
        selected.push(checkbox.value);
    });
    return selected;
}
