<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>회의 예약</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="${contextPath}/resources/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/dist/css/adminlte.min.css">

  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />


<style type="text/css">
	
	.first-area{
		margin-bottom: 5rem;
		margin-left: auto;
		margin-right: auto;
		transition: .8s;
		margin-top: 5rem;
	}
	
	#calendarWrapper{
	display: none;
	}
	
	.secondArea, .ThirdArea{
		display: none;
	}
	.selection{
		text-align: center;
		
	}
	.cards{
		display:inline-block;
	 	margin:.8rem;
	 	transition: .8s;
	 	cursor: pointer;
	}
	.cards:hover{
		background: lightblue;
		/* margin:.9rem; */
	}
	.cardsSelect{
		background: lightgray;
		border: 2px solid rgb(150,150,150);
	}
	.fc-day:hover{
		background: lightblue;
	}
	#joinEmp{
		display:inline-block;
		border: none;
		margin: 5px;
		padding: 5px;
		clear: both;
		width: 30%;		
	}
	#joinEmp:focus{
	outline: none;
	}
	
	.calssArea{
		zoom: 0.9;
		float:left;
		text-align: center; 
		border: 1px solid #5CD1E5; 
		background: #4ABFD3; 
		color:white;
		border-radius: 1rem;
		padding: 12px;
		padding-top:5px;
		padding-bottom: 5px;
		margin: 5px;
		transition: .8s;
	}
	#commit{
		/* display: none; */
		text-align: center;
		margin: auto;
	}
	.buttonArea{
		text-align: center;
		margin-top: 2rem;
		margin-bottom: 2rem;
	}
	.notFcards{
		display:inline-block;
	 	margin:.8rem;
	 	transition: .8s;
	 	background: rgb(20,20,50);
	 	color: rgb(255,255,255);
	}
	.fc-scroller {
   	overflow-y: hidden !important;
	}
	
	.ui-autocomplete, .ui-menu
    {
    	position : fixed;
        z-index: 1 !important;
    }

	.reserv-bar, card-primary, card-header {
		z-index: -1;
	}


</style>


</head>
<body class="hold-transition sidebar-mini">

	<script type="text/javascript">
		var joinEmp ="";//참여 emp
		var date = ""; //참여일
		var SelectTime = "";//선택시간
		var mNo = "";//회의실 번호
		var savedTime="";//예약되어있는시간
	</script>

<div class="wrapper">
  <!-- header -->
  <jsp:include page="../common/header.jsp"></jsp:include>
  <!-- /header -->


  <!-- Main Sidebar Container -->
   <jsp:include page="../common/sidebar.jsp"></jsp:include>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-8">
            <h1>회의실 예약</h1>
          </div>
          <div class="col-sm-4">
           <div class="form-group">
                        <select class="form-control">
                          <option>중앙 회의실</option>
                          <option>회의실 A</option>
                          <option>회의실 B</option>
                          <option>회의실 C</option>
                          <option>회의실 D</option>
                        </select>
            </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->

    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
        
        
          <div class="col-md-3">
                   
            <div class="sticky-top mb-3">  
    
       <!-- 회의실 예약 바 -->   
           <div class="card card-primary">
			<input class="inputModal" type="text" id="joinEmp" placeholder="참가인 추가"> 
     
  
  
  <br><br><br><br>         
              <div class="form-group">
                <label for="inputName">예약 가능 시간</label>
	            
	            
	            
              </div>
              
              <div class="form-group">
                <label for="inputName">회의 제목</label>
                <input type="text" id="inputName" class="form-control" placeholder="회의 제목을 입력하세요.">
              </div>
              
              <div class="form-group">
                <label for="inputDescription">회의 상세 설명</label>
                <textarea id="inputDescription" class="form-control" rows="4" placeholder="회의  상세 설명을 입력하세요."></textarea>
              </div>
                                       
            <div class="card-body">


              <div class="form-group">
                <label for="inputClientCompany">총 참여 사원</label>
                       <button type="button" class="btn btn-block bg-gradient-info btn-sm">강건강 - 영업팀</button>
                      <button type="button" class="btn btn-block bg-gradient-info btn-sm">남나눔 - 기획팀</button>
                      <button type="button" class="btn btn-block bg-gradient-info btn-sm">류라라 - 생산팀</button>
                      <br>
                      <button type="button" class="btn btn-info btn-sm">강건강 - 영업팀</button>
                      <button type="button" class="btn btn-info btn-sm">남나눔 - 기획팀</button>
                      <button type="button" class="btn btn-info btn-sm">류라라 - 생산팀</button>

                  <br><br>
                     <button type="button" class="btn btn-block btn-primary">예약하기</button>
                   
              </div>
            </div>
            <!-- /.card-body -->
          </div>          
          <!-- 끝 -->  
          
          
                
              <div class="card" style="display:none;">
                <div class="card-header">
                  <h4 class="card-title">Draggable Events</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  <div id="external-events">
                    <div class="external-event bg-success">회의 A</div>
                    <div class="external-event bg-warning">회의 B</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox" id="drop-remove">
                        remove after drop
                      </label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
              <div class="card" style="display:none;">
                <div class="card-header">
                  <h3 class="card-title">Create Event</h3>
                </div>
                <div class="card-body">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <ul class="fc-color-picker" id="color-chooser">
                      <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                    </ul>
                  </div>
                  <!-- /btn-group -->
                  <div class="input-group">
                    <input id="new-event" type="text" class="form-control" placeholder="회의 제목 입력">               
                    <div class="input-group-append">
                      <button id="add-new-event" type="button" class="btn btn-primary">Add</button>
                    </div>
                    <!-- /btn-group -->
                    
                  </div>
                  <!-- /input-group -->
                </div>
              </div>
            </div>
          </div>
          
          
          
          
          
          
          <!-- /.col -->
          <div class="col-md-9">         
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

   <jsp:include page="../common/footer.jsp"></jsp:include>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="${contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="${contextPath}/resources/plugins/moment/moment.min.js"></script>
<script src="${contextPath}/resources/plugins/fullcalendar/main.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}/resources/dist/js/demo.js"></script>
<!-- Page specific script -->

  <!--자동완성  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- 참가인 추가 -->

	<script type="text/javascript">
		$(document).on('keyup','#joinEmp',function(){
				var search = $(this).val();
				$.ajax({
				url:"searchEmpList.meet",
				data:{search:search},
				dataType:"json",
				success : function(data){
					var list = [];
					if(data.length > 0){
						for(var i in data){
							var inputText = decodeURIComponent(data[i].replace(/\+/g," "));
							if(!joinEmp.includes(inputText)){
								list.push(inputText);
								console.log("list : " + list);
							}
						}
						$("#joinEmp").autocomplete({
							source:list,
							select: function(event, ui) {
								console.log(ui.item);
								/* $(this).attr('readonly',true); */
								addFun(ui.item.value);
								return false;
					        },
					        focus: function(event, ui) {
					            return false;
					        }
						});
					}
				}
			});
	});
			function addFun(value){
					var $div = $(".extraArea");
				var $span = $("<span class='calssArea'>").text(value);
				if(joinEmp.includes(value)){
					alert("이미 추가한 사원입니다.");
				}else{
					joinEmp += value+";";
					$div.append($span);
				}
				$("#joinEmp").val("");
				}
				
				$(document).on('click','.calssArea',function(){
					var text = $(this).text();
					if(confirm(text +" 사원을 정말로 삭제하시겠습니까?")){
						$(this).fadeOut(500);
						var array = joinEmp.split(";");
						joinEmp = "";
						for ( var i in array ) {
							if(array[i]==text){
								array[i]="";
							}else{
								array[i]+=";";
							}
							joinEmp+=array[i];
					      }
						joinEmp=joinEmp.substr(0,joinEmp.length-1);
						console.log(joinEmp);
					}
				});		
	</script>




<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    });

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954', //red
          allDay         : true
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : '오전 회의',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : '점심 회의',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'https://www.google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    })
  })
</script>
</body>
</html>