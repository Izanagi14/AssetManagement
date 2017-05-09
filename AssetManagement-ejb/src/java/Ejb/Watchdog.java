/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author apurv
 */
@Entity
@Table(name = "Watchdog")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Watchdog.findAll", query = "SELECT w FROM Watchdog w")
    , @NamedQuery(name = "Watchdog.findByAssetID", query = "SELECT w FROM Watchdog w WHERE w.assetID = :assetID")
    , @NamedQuery(name = "Watchdog.findByEid", query = "SELECT w FROM Watchdog w WHERE w.eid = :eid")
    , @NamedQuery(name = "Watchdog.findByCid", query = "SELECT w FROM Watchdog w WHERE w.cid = :cid")
    , @NamedQuery(name = "Watchdog.findByWid", query = "SELECT w FROM Watchdog w WHERE w.wid = :wid")})
public class Watchdog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "AssetID")
    private String assetID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "EID")
    private String eid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "CID")
    private String cid;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "WID")
    private Integer wid;

    public Watchdog() {
    }

    public Watchdog(Integer wid) {
        this.wid = wid;
    }

    public Watchdog(Integer wid, String assetID, String eid, String cid) {
        this.wid = wid;
        this.assetID = assetID;
        this.eid = eid;
        this.cid = cid;
    }

    public String getAssetID() {
        return assetID;
    }

    public void setAssetID(String assetID) {
        this.assetID = assetID;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wid != null ? wid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Watchdog)) {
            return false;
        }
        Watchdog other = (Watchdog) object;
        if ((this.wid == null && other.wid != null) || (this.wid != null && !this.wid.equals(other.wid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Ejb.Watchdog[ wid=" + wid + " ]";
    }
    
}
