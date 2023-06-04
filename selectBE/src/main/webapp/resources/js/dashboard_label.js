
// earningt라는 ID를 가진 HTML 요소를 찾아 earning에 할당
const bar = document.getElementById('bar');


new Chart(bar, {
    type: 'bar',
    data: {
      labels: ['Total', 'paper', 'pack', 'can', 'pet', 'plastic', 'glass', 'vinly'],
      datasets: [{
        label: '재활용 쓰레기',
        data: [12000, 1090, 3000, 5400, 1220, 3600, 4800, 4578],
        backgroundColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)'
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
  