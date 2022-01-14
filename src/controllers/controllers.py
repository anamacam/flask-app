from flask import request, render_template, redirect, flash
from flask.views import MethodView
from src.db import mysql

class indexController(MethodView):
	def get(self):
		return "¡Hello chicas Ada!"

	def post(self):
		clientes = request.form['clientes']
		cuenta = request.form['cuenta']
		operaciones = request.form['operaciones']
		transacciones = request.form['transacciones']
		print(clientes, cuenta, operaciones, transacciones)

		return render_template('public/index.html', cuenta=cuenta, clente=clientes)
