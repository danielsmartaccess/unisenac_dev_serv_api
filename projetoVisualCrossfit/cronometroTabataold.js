// Carrega os exercícios do servidor quando a página é carregada
document.addEventListener('DOMContentLoaded', () => {
    fetchExercicios();
});

// Adiciona evento de clique ao botão de iniciar o cronômetro Tabata
document.getElementById('startButton').addEventListener('click', startTabataTimer);

// Função para buscar exercícios do servidor e exibir como checkboxes
function fetchExercicios() {
    fetch('http://localhost:3001/exercicios') // Substitua pela URL do seu endpoint
        .then(response => response.json())
        .then(exercicios => {
            const container = document.getElementById('exercicios-container');
            exercicios.forEach(exercicio => {
                // Criação de checkbox para cada exercício
                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.id = exercicio.id;
                checkbox.value = exercicio.nome;

                // Criação de label para cada checkbox
                const label = document.createElement('label');
                label.htmlFor = exercicio.id;
                label.textContent = exercicio.nome;

                // Adicionando checkbox e label ao container
                container.appendChild(checkbox);
                container.appendChild(label);
                container.appendChild(document.createElement('br'));
            });
        })
        .catch(error => console.error('Erro ao buscar exercícios:', error));
}

// Função para obter os exercícios selecionados
function getSelectedExercises() {
    const selected = [];
    document.querySelectorAll('#exercicios-container input[type="checkbox"]:checked').forEach(checkbox => {
        selected.push(checkbox.value);
    });
    return selected;
}

// Função para gerar um som de beep (usada para avisos sonoros durante o cronômetro)
function beep(frequency, duration) {
    const audioContext = new (window.AudioContext || window.webkitAudioContext)();
    const oscillator = audioContext.createOscillator();
    const gainNode = audioContext.createGain();

    // Configuração do beep
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
    // Calcula horas, minutos e segundos
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    // Atualiza o display do temporizador
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
        displayTimer(second, isRestPeriod);
        // Avisos sonoros com base no tempo restante
        if (isRestPeriod) {
            beep(300, 1000); // Durante o tempo de descanso
        } else if (second === duration) {
            beep(1000, 3000); // No início do exercício
        } else if (second <= 5) {
            beep(800, 1000); // Nos últimos 5 segundos do exercício
        }
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
}

// Função para iniciar o cronômetro Tabata
async function startTabataTimer() {
    const selectedExercises = getSelectedExercises();
    const exerciseDisplay = document.getElementById('exercise-display');
    exerciseDisplay.innerText = 'Exercícios Selecionados: ' + selectedExercises.join(', ');

    // Configuração das rodadas, tempo de exercício e descanso
    const rounds = parseInt(document.getElementById('rounds').value);
    const workTime = parseInt(document.getElementById('workTime').value);
    const restTime = parseInt(document.getElementById('restTime').value);

    // Execução de cada rodada do Tabata
    for (let round = 1; round <= rounds; round++) {
        updateRoundDisplay(round, rounds);
        await startRound(workTime, false); // Tempo de exercício
        await startRound(restTime, true);  // Tempo de descanso
    }

    beep(800, 300); // Aviso sonoro de término do Tabata
    alert("Tabata completo!");
    updateRoundDisplay(0, rounds);
}
