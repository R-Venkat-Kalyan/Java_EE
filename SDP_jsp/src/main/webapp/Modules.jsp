<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>EP Project</title>
  <link href="https://unpkg.com/tailwindcss@^2.2.4/dist/tailwind.min.css" rel="stylesheet">

  <style>
    @import url('https://fonts.googleapis.com/css?family=Heebo:400,700|Open+Sans:400,700');

    :root {
      --color: #3c3163;
      --transition-time: 0.5s;
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      font-family: 'Open Sans';
      background-image: linear-gradient(to right, #8360c3, #2ebf91);
    }

    a {
      color: inherit;
    }

    .cards-wrapper {
      display: grid;
      justify-content: center;
      align-items: center;
      grid-template-columns: 1fr 1fr 1fr;
      grid-gap: 4rem;
      padding: 4rem;
      margin: 0 auto;
      width: max-content;
    }

    .card {
      font-family: 'Heebo';
      --bg-filter-opacity: 0.5;
      background-image: linear-gradient(rgba(0, 0, 0, var(--bg-filter-opacity)), rgba(0, 0, 0, var(--bg-filter-opacity))), var(--bg-img);
      height: 20em;
      width: 15em;
      font-size: 1.5em;
      color: white;
      border-radius: 1em;
      padding: 1em;
      /*margin: 2em;*/
      display: flex;
      align-items: flex-end;
      background-size: cover;
      background-position: center;
      /* box-shadow: 0 0 5em -1em black; */
      box-shadow: none;
      transition: all, var(--transition-time);
      position: relative;
      overflow: hidden;
      border: 10px solid #ccc;
      text-decoration: none;
    }

    .card:hover {
      transform: rotate(0);
    }

    .card h1 {
      margin: 0;
      font-size: 1.5em;
      line-height: 1.2em;
    }

    .card p {
      font-size: 0.75em;
      font-family: 'Open Sans';
      margin-top: 0.5em;
      line-height: 2em;
    }

    .card .tags {
      display: flex;
    }

    .card .tags .tag {
      font-size: 0.75em;
      background: rgba(255, 255, 255, 0.5);
      border-radius: 0.3rem;
      padding: 0 0.5em;
      margin-right: 0.5em;
      line-height: 1.5em;
      transition: all, var(--transition-time);
    }

    .card:hover .tags .tag {
      background: var(--color);
      color: white;
    }

    /* .card .date {
      position: absolute;
      top: 0;
      right: 0;
      font-size: 0.75em;
      padding: 1em;
      line-height: 1em;
      opacity: .8;
    } */

    .card:before,
    .card:after {
      content: '';
      transform: scale(0);
      transform-origin: top left;
      border-radius: 50%;
      position: absolute;
      left: -50%;
      top: -50%;
      z-index: -5;
      transition: all, var(--transition-time);
      transition-timing-function: ease-in-out;
    }

    .card:before {
      background: #ddd;
      width: 250%;
      height: 250%;
    }

    .card:after {
      background: white;
      width: 200%;
      height: 200%;
    }

    .card:hover {
      color: var(--color);
    }

    .card:hover:before,
    .card:hover:after {
      transform: scale(1);
    }

    .card-grid-space .num {
      font-size: 3em;
      margin-bottom: 1.2rem;
      margin-left: 1rem;
    }

    .info {
      font-size: 1.2em;
      display: flex;
      padding: 1em 3em;
      height: 3em;
    }

    .info img {
      height: 3em;
      margin-right: 0.5em;
    }

    .info h1 {
      font-size: 1em;
      font-weight: normal;
    }

    /* MEDIA QUERIES */
    @media screen and (max-width: 1285px) {
      .cards-wrapper {
        grid-template-columns: 1fr 1fr;
      }
    }

    @media screen and (max-width: 900px) {
      .cards-wrapper {
        grid-template-columns: 1fr;
      }

      .info {
        justify-content: center;
      }

      /* .card-grid-space .num {
        /margin-left: 0;
        /text-align: center;
      } */
    }

    @media screen and (max-width: 500px) {
      .cards-wrapper {
        padding: 4rem 2rem;
      }

      .card {
        max-width: calc(100vw - 4rem);
      }
    }

    @media screen and (max-width: 450px) {
      .info {
        display: block;
        text-align: center;
      }

      .info h1 {
        margin: 0;
      }
    }

  </style>
</head>

<body>
  <jsp:include page="Inner_navbar.html"></jsp:include>
  <section class="cards-wrapper">
    <div class="card-grid-space">
      <!-- <div class="num">01</div> -->
      <a class="card" href="Attendance.jsp" style="--bg-img: url(images/card1.png);">
        <div>
          <h3>Attendance Register</h3>
          <p>It provides a historical record of attendance.</p>
          <!-- <div class="date">6 Oct 2017</div> -->
          <div class="tags">
            <div class="tag">Get Register</div>
          </div>
        </div>
      </a>
    </div>
    <div class="card-grid-space">
      <!-- <div class="num">02</div> -->
      <a class="card" href="TimeTable.jsp" style="--bg-img: url(images/card2.png);">
        <div>
          <h3>Time Table</h3>
          <p>It provides students a complete schedule of their classes.</p>
          <!-- <div class="date">9 Oct 2017</div> -->
          <div class="tags">
            <div class="tag">Get Schedule</div>
          </div>
        </div>
      </a>
    </div>
<!--     <div class="card-grid-space">
       <a class="card" href="" style="--bg-img: url(images/card3.png);">
        <div>
          <h3>CGPA</h3>
          <p>It provides the marks record to students</p>
          
          <div class="tags">
            <div class="tag">Get CGPA</div>
          </div>
        </div>
      </a>
    </div> -->
    
    <!-- https://images.unsplash.com/photo-1520839090488-4a6c211e2f94?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=38951b8650067840307cba514b554ba5&auto=format&fit=crop&w=1350&q=80 -->
  </section>

</body>

</html>