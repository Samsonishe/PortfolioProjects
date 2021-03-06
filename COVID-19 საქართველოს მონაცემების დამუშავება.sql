-- COVID-19 საქართველოს მონაცემები პირველი შემთხვევის დაფიქსირებიდან 20 ნოემბრამდე

SELECT * FROM portfolio.covid_data;



-- შემთხვევების რაოდენობა vs სიკვდილიანობის მაჩვენებელი
-- ასახავს თარიღის მიხედვით სიკვდილიანობის ალბათობას დაინფიცირების შემთხვევაში

SELECT date, total_cases, total_deaths, (total_deaths / total_cases) * 100 AS DeathPercentage
FROM portfolio.covid_data;



-- შემთხვევების რაოდენობა vs მოსახლეობის რაოდენობა
-- ასახავს მოსხლეობის რამდენი პროცენტი დაინფიცირდა (თარიღის მიხედვით)

SELECT date, Population, total_cases, (total_cases/population) * 100 as PercentPopulationInfected
FROM portfolio.covid_data;



-- შემთხვევების სრული რაოდენობა vs მოსახლეობა
-- მოსახლეობის რამდენმა პროცენტმა გადაიტანა და/ან არის ინფიცირებული

SELECT MAX(total_cases) / population * 100 AS totalinfected
FROM portfolio.covid_data;



-- ვაქცინირებულთა რაოდენობა vs მოსახლეობა
-- მოსახლეობის რამდენი პროცენტია ვაქცინირებული (თარიღის მიხედვით)

SELECT date, total_vaccinations, population, (total_vaccinations / population) * 100 AS vaccinationperpopulation
FROM portfolio.covid_data;



-- ვაქცინირებულთა სრული რაოდენობა vs მოსახლეობა
-- მოსახლეობის რამდენი პროცენტია ვაქცინირებული

SELECT MAX(total_vaccinations) / population * 100 AS vaccinatedpopulation
FROM portfolio.covid_data;



-- საშუალო მაჩვენებლები:
-- 1.შემთხვეევების რაოდენობა 2.სიკვდილიანობა 3.ვაქცინაცია

SELECT ROUND(AVG(total_cases)) AS averagetotalcase, ROUND(AVG(total_deaths)) AS averagetotaldeath, ROUND(AVG(total_vaccinations)) AS averagetotalvaccination
FROM portfolio.covid_data;