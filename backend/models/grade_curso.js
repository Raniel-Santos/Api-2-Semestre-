import { Sequelize } from "sequelize";
import db from '../config/db.js'

const GradeCurso = db.define('GradeCurso',{
    id:{
        type:Sequelize.INTEGER,
        autoIncrement:true,
        allowNull: false,
        primaryKey: true
    },
    nome_curso:{
        type:Sequelize.STRING,
        allowNull:true,
    }
})

export default GradeCurso