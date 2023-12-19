// Carrega os exercícios do servidor quando a página é carregada
document.addEventListener('DOMContentLoaded', () => {
    fetchExercicios();
});

// Carrega os exercícios do servidor e exibe como opções selecionáveis
function fetchExercicios() {
    fetch('http://localhost:3001/exercicios') // Substitua pela URL do seu servidor
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

/// Inicia o cronômetro AMRAP
document.getElementById('startAmrapButton').addEventListener('click', startAmrapTimer);


function startAmrapTimer() {
    const duration = parseInt(document.getElementById('amrapDuration').value) * 60;
    const exerciseDisplay = document.getElementById('exercise-display');
    const selectedExercises = getSelectedExercises();
    exerciseDisplay.innerText = 'Exercícios Selecionados: ' + selectedExercises.join(', ');

    document.getElementById('startAmrapButton').disabled = true;
    countDown(duration);
}

// Contagem regressiva para o AMRAP
function countDown(seconds) {
    if (seconds < 0) {
        alert('AMRAP completo!');
        document.getElementById('startAmrapButton').disabled = false;
        return;
    }

    displayTimer(seconds);
    setTimeout(() => {
        countDown(seconds - 1);
    }, 1000);
}

// Exibe o temporizador na tela
function displayTimer(seconds) {
    const timerDisplay = document.getElementById('timer-display');
    const minutes = Math.floor(seconds / 60);
    const secs = seconds % 60;
    timerDisplay.innerText = `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
}

// Obtém os exercícios selecionados
function getSelectedExercises() {
    const selected = [];
    document.querySelectorAll('#exercicios-container input[type="checkbox"]:checked').forEach(checkbox => {
        selected.push(checkbox.value);
    });
    return selected;
}
