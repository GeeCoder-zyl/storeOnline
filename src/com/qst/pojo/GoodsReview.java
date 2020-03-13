package com.qst.pojo;
// Generated 2019-8-6 21:46:28 by Hibernate Tools 5.2.3.Final

import java.util.Date;
import java.util.Set;

/**
 * GoodsReview generated by hbm2java
 */
public class GoodsReview implements java.io.Serializable {

	private Integer grId;
	private String grContent;
	private int grUid;
	private int grPid;
	private Date grCreatTime;
	private double grStar;
	private int grStatus;
	private int grGoid;

	private GoodsUser goodsUser;

	private Set<GoodsCommandImg> goodsCommandImgSet;

	public GoodsReview() {
	}

	public GoodsReview(String grContent, String grUname, int grPid, Date grCreatTime, double grStar, int grStatus) {
		this.grContent = grContent;
		this.grPid = grPid;
		this.grCreatTime = grCreatTime;
		this.grStar = grStar;
		this.grStatus = grStatus;
	}

	public Integer getGrId() {
		return this.grId;
	}

	public void setGrId(Integer grId) {
		this.grId = grId;
	}

	public String getGrContent() {
		return this.grContent;
	}

	public void setGrContent(String grContent) {
		this.grContent = grContent;
	}

	public int getGrPid() {
		return this.grPid;
	}

	public void setGrPid(int grPid) {
		this.grPid = grPid;
	}

	public Date getGrCreatTime() {
		return this.grCreatTime;
	}

	public void setGrCreatTime(Date grCreatTime) {
		this.grCreatTime = grCreatTime;
	}

	public double getGrStar() {
		return this.grStar;
	}

	public void setGrStar(double grStar) {
		this.grStar = grStar;
	}

	public int getGrStatus() {
		return this.grStatus;
	}

	public void setGrStatus(int grStatus) {
		this.grStatus = grStatus;
	}

	public Set<GoodsCommandImg> getGoodsCommandImgSet() {
		return goodsCommandImgSet;
	}

	public void setGoodsCommandImgSet(Set<GoodsCommandImg> goodsCommandImgSet) {
		this.goodsCommandImgSet = goodsCommandImgSet;
	}

	/**
	 * @return the grUid
	 */
	public int getGrUid() {
		return grUid;
	}

	/**
	 * @param grUid the grUid to set
	 */
	public void setGrUid(int grUid) {
		this.grUid = grUid;
	}

	/**
	 * @return the grGoid
	 */
	public int getGrGoid() {
		return grGoid;
	}

	/**
	 * @param grGoid the grGoid to set
	 */
	public void setGrGoid(int grGoid) {
		this.grGoid = grGoid;
	}

	public GoodsUser getGoodsUser() {
		return goodsUser;
	}

	public void setGoodsUser(GoodsUser goodsUser) {
		this.goodsUser = goodsUser;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */

	@Override
	public String toString() {
		return "GoodsReview{" +
				"grId=" + grId +
				", grContent='" + grContent + '\'' +
				", grUid=" + grUid +
				", grPid=" + grPid +
				", grCreatTime=" + grCreatTime +
				", grStar=" + grStar +
				", grStatus=" + grStatus +
				", grGoid=" + grGoid +
				", goodsUser=" + goodsUser +
				", goodsCommandImgSet=" + goodsCommandImgSet +
				'}';
	}
}