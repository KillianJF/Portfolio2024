// var currentLanguage = document.getElementById("currentLanguage").value;
// console.log(currentLanguage);


function changeLanguage(lang) {
    console.log("lancement fonction changeLanguage")

    document.getElementById("titleIndex").textContent = dataIndex[lang]["titleIndex"];
    document.getElementById("h3").textContent = dataIndex[lang]["h3"];

    document.getElementById("Accueil").textContent = dataIndex[lang]["Accueil"];
    document.getElementById("quiSuisJe").textContent = dataIndex[lang]["quiSuisJe"];

    document.getElementById("hermesTitle").textContent = dataIndex[lang]["hermesTitle"];
    document.getElementById("hermesType").textContent = dataIndex[lang]["hermesType"];
    document.getElementById("clubmedTitle").textContent = dataIndex[lang]["clubmedTitle"];
    document.getElementById("clubmedType").textContent = dataIndex[lang]["clubmedType"];
    document.getElementById("couleurTitle").textContent = dataIndex[lang]["couleurTitle"];
    document.getElementById("couleurType").textContent = dataIndex[lang]["couleurType"];
    document.getElementById("trailTitle").textContent = dataIndex[lang]["trailTitle"];
    document.getElementById("trailType").textContent = dataIndex[lang]["trailType"];
    document.getElementById("amityTitle").textContent = dataIndex[lang]["amityTitle"];
    document.getElementById("amityType").textContent = dataIndex[lang]["amityType"];
    document.getElementById("djiTitle").textContent = dataIndex[lang]["djiTitle"];
    document.getElementById("djiType").textContent = dataIndex[lang]["djiType"];

    document.getElementById("copyright").textContent = dataIndex[lang]["copyright"];



    document.getElementById("titleQuiSuisJe").textContent = dataQuiSuisJe[lang]["titleQuiSuisJe"];
    document.getElementById("h3").textContent = dataQuiSuisJe[lang]["h3"];
    document.getElementById("Accueil").textContent = dataQuiSuisJe[lang]["Accueil"];
    document.getElementById("quiSuisJe").textContent = dataQuiSuisJe[lang]["quiSuisJe"];
    document.getElementById("h2QuiSuisje").textContent = dataQuiSuisJe[lang]["h2QuiSuisje"];
    document.getElementById("p1").textContent = dataQuiSuisJe[lang]["p1"];
    document.getElementById("p2").textContent = dataQuiSuisJe[lang]["p2"];
    document.getElementById("p3").textContent = dataQuiSuisJe[lang]["p3"];
    document.getElementById("p4").textContent = dataQuiSuisJe[lang]["p4"];
    document.getElementById("p5").textContent = dataQuiSuisJe[lang]["p5"];
    document.getElementById("p6").textContent = dataQuiSuisJe[lang]["p6"];
    document.getElementById("copyright").textContent = dataQuiSuisJe[lang]["copyright"];

}