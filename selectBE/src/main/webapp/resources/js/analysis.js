var ctx = document.getElementById('chart').getContext('2d');
            var score = 85; // 예시로 85점을 설정하였습니다.

            var chart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                datasets: [{
                data: [score, 100 - score],
                backgroundColor: ['#287bff', '#ccc'],
                borderWidth: 0
                }]
            },
            options: {
                cutoutPercentage: 70,
                rotation: 1 * Math.PI,
                circumference: 1 * Math.PI,
                responsive:false,
                legend: {
                display: false
                },
                tooltips: {
                enabled: false
                }
            }
 
            });

            // 반원 도넛 차트 안에 점수
            Chart.pluginService.register({
                beforeDraw: function(chart) {
                

                  var width = chart.chart.width,
                      height = chart.chart.height,
                      ctx = chart.chart.ctx;
                  ctx.restore();
                  
                  ctx.font = "3.5rem 'MBC1961M'";
                  ctx.textBaseline = "middle";
                  var text = "75",
                      textX = Math.round((width - ctx.measureText(text).width) / 2),
                      textY = height / 1.35;
                  ctx.fillText(text, textX, textY);
                  ctx.save();
                }
              });
