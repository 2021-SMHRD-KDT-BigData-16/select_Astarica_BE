
// prediction라는 ID를 가진 HTML 요소를 찾아 prediction에 할당
const prediction = document.getElementById('prediction');
const doughnut = document.getElementById('doughnut');
const bar = document.getElementById('bar');

new Chart(prediction, {
    type: 'bar',
    data: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
      datasets: [{
        label: 'prediction',
        data: [1200, 1090, 3000, 5400, 1220, 3600, 4800, 4578, 2556, 8545, 4587, 9000],
        backgroundColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
      }]
    },
    options: {
      scales: {
        // y축 옵션
        y: {
          // y축이 0에서 시작하도록 지정
          beginAtZero: true,
          // 반응형 차트
          reponsive: true,
        }
      }
    }
  });

  new Chart(doughnut, {
    type: 'doughnut',
    data: {
      datasets: [{
        data: [10, 40, 50],
        backgroundColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(54, 162, 235, 1)'
        ],
      }],
      labels: [
        'Red',
        'Yellow',
        'Blue'
      ]
    }
  });

  new Chart(bar, {
    type: 'bar',
    data: {
      labels: ['~ 0.0', '0.0 ~ 0.1', '0.1 ~ 0.2', '0.2 ~ 0.3', '0.3 ~ 0.4', '0.4 ~ 0.5', '0.5 ~ 0.6', '0.6 ~ 0.7', '0.7 ~ 0.8', '0.8 ~ 0.9', '0.9 ~ 1.0'],
      datasets: [{
        label: 'prediction',
        data: [0, 295, 0, 0, 0, 0, 0, 78, 56, 0, 495, 717],
        backgroundColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
      }]
    },
    options: {
      scales: {
        // y축 옵션
        y: {
          // y축이 0에서 시작하도록 지정
          beginAtZero: true,
          // 반응형 차트
          reponsive: true,
        }
      }
    }
  });