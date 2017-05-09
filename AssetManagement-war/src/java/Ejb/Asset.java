/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author apurv
 */
@Entity
@Table(name = "Asset")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Asset.findAll", query = "SELECT a FROM Asset a")
    , @NamedQuery(name = "Asset.findByAssetID", query = "SELECT a FROM Asset a WHERE a.assetID = :assetID")
    , @NamedQuery(name = "Asset.findByDate", query = "SELECT a FROM Asset a WHERE a.date = :date")
    , @NamedQuery(name = "Asset.findByEid", query = "SELECT a FROM Asset a WHERE a.eid = :eid")
    , @NamedQuery(name = "Asset.findByMinutesFrom", query = "SELECT a FROM Asset a WHERE a.minutesFrom = :minutesFrom")
    , @NamedQuery(name = "Asset.findByMinutesTo", query = "SELECT a FROM Asset a WHERE a.minutesTo = :minutesTo")})
public class Asset implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "AssetID")
    private String assetID;
    @Lob
    @Size(max = 65535)
    @Column(name = "Asset_Name")
    private String assetName;
    @Column(name = "Date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Lob
    @Size(max = 65535)
    @Column(name = "Quality")
    private String quality;
    @Size(max = 100)
    @Column(name = "Eid")
    private String eid;
    @Column(name = "Minutes_From")
    @Temporal(TemporalType.DATE)
    private Date minutesFrom;
    @Column(name = "Minutes_To")
    @Temporal(TemporalType.DATE)
    private Date minutesTo;

    public Asset() {
    }

    public Asset(String assetID) {
        this.assetID = assetID;
    }

    public String getAssetID() {
        return assetID;
    }

    public void setAssetID(String assetID) {
        this.assetID = assetID;
    }

    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public Date getMinutesFrom() {
        return minutesFrom;
    }

    public void setMinutesFrom(Date minutesFrom) {
        this.minutesFrom = minutesFrom;
    }

    public Date getMinutesTo() {
        return minutesTo;
    }

    public void setMinutesTo(Date minutesTo) {
        this.minutesTo = minutesTo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (assetID != null ? assetID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Asset)) {
            return false;
        }
        Asset other = (Asset) object;
        if ((this.assetID == null && other.assetID != null) || (this.assetID != null && !this.assetID.equals(other.assetID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Ejb.Asset[ assetID=" + assetID + " ]";
    }
    
}
