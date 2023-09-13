ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "3.3.1"

lazy val root = (project in file("."))
  .settings(
    name := "ontology-generator",
    libraryDependencies += "org.apache.jena" % "apache-jena-libs" % "4.4.0"
  )
