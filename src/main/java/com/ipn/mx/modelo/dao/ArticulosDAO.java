package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.DatosGraficaDTO;
import com.ipn.mx.modelo.entidades.Articulos;
import com.ipn.mx.utilerias.HibernateUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ArticulosDAO {

    private static final String SQL_GRAFICAR = "select Categoria.nombreCategoria, count(Articulos.idArticulo) as cantidad from Categoria"
            + " inner join Articulos on Categoria.idCategoria = Articulos.idCategoria group by Categoria.idCategoria";

    private Connection conexion;

    public Connection obtenerConexion() {
        //obtener conexion
        String usuario = "root";
        String clave = "root";
        String url = "jdbc:mysql://localhost:3306/ProyectoBase4";
        String driverBD = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driverBD);
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ArticulosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return conexion;
    }

    public void create(Articulos a) throws SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.persist(a);
            transaction.commit();
        } catch(HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void update(Articulos a) throws SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.merge(a);
            transaction.commit();
        } catch(HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void delete(Articulos a) throws SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            session.remove(a);
            transaction.commit();
        } catch(HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public Articulos read(Articulos a) throws SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        try {
            transaction.begin();
            a = (Articulos) session.get(a.getClass(), a.getIdArticulo());
            transaction.commit();
        } catch(HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return a;
    }

    public List readAll() throws SQLException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List resultados = new ArrayList();
        try {
            transaction.begin();
            Query q = session.createQuery("from Articulos", Articulos.class);
            resultados = q.list();
            transaction.commit();
        } catch(HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
        return resultados;
    }

    public List graficar() throws SQLException {
        obtenerConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List lista = new ArrayList<>();

        try {
            ps = conexion.prepareStatement(SQL_GRAFICAR);
            rs = ps.executeQuery();
            
            while(rs.next()){
                DatosGraficaDTO datos = new DatosGraficaDTO();
                datos.setNombre(rs.getString("nombreCategoria"));
                datos.setCantidad(rs.getInt("cantidad"));
                lista.add(datos);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conexion != null) {
                conexion.close();
            }
        }
        
        return lista;
    }

    public static void main(String[] args) {
        ArticulosDAO dao = new ArticulosDAO();
        Articulos a = new Articulos();
        //a.setIdArticulo(5);
        a.setNombreArticulo("Laptop Dell");
        a.setDescripcionArticulo("16gb ram 500 hdd ryzen 5");
        a.setExistencias(10);
        a.setStockMinimo(5);
        a.setStockMaximo(15);
        a.setPrecio(238.49); // decimal(5,2)
        a.setIdCategoria(2);

        try {
            //dao.delete(a);
            //System.out.println(dao.read(a));
            //dao.update(a);
            dao.create(a);
            //System.out.println(dao.readAll());
            //System.out.println(dao.graficar());
        } catch (SQLException ex) {
            Logger.getLogger(ArticulosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
