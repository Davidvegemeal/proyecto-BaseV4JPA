package com.ipn.mx.modelo.entidades;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Articulos")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Articulos implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idArticulo;
    
    @Column(name = "nombreArticulo", length = 50, nullable = false)
    private String nombreArticulo;
    
    @Column(name = "descripcionArticulo", length = 100, nullable = false)
    private String descripcionArticulo;
    
    @Column(name = "existencias", nullable = false)
    private int existencias;
    
    @Column(name = "stockMinimo", nullable = false)
    private int stockMinimo;
    
    @Column(name = "stockMaximo", nullable = false)
    private int stockMaximo;
    
    @Column(name = "precio", nullable = false)
    private double precio;
    
    @ManyToOne (fetch = FetchType.EAGER)
    @JoinColumn(name = "idCategoria")
    private int idCategoria;    // Categoria idCategoria
}
