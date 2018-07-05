package com.vo;

public class HanRiver {
	private String year;
	private String region;
	private int total;
	private int people;
	private int gym;
	private int bicycle;
	private int event;
	private int park;
	
	public HanRiver() {
		super();
	}

	public HanRiver(String year, String region, int total, int people, int gym, int bicycle, int event, int park) {
		super();
		this.year = year;
		this.region = region;
		this.total = total;
		this.people = people;
		this.gym = gym;
		this.bicycle = bicycle;
		this.event = event;
		this.park = park;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPeople() {
		return people;
	}

	public void setUser(int people) {
		this.people = people;
	}

	public int getGym() {
		return gym;
	}

	public void setGym(int gym) {
		this.gym = gym;
	}

	public int getBicycle() {
		return bicycle;
	}

	public void setBicycle(int bicycle) {
		this.bicycle = bicycle;
	}

	public int getEvent() {
		return event;
	}

	public void setEvent(int event) {
		this.event = event;
	}

	public int getPark() {
		return park;
	}

	public void setPark(int park) {
		this.park = park;
	}

	@Override
	public String toString() {
		return "HanRiver [year=" + year + ", region=" + region + ", total=" + total + ", people=" + people + ", gym=" + gym
				+ ", bicycle=" + bicycle + ", event=" + event + ", park=" + park + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bicycle;
		result = prime * result + event;
		result = prime * result + gym;
		result = prime * result + park;
		result = prime * result + ((region == null) ? 0 : region.hashCode());
		result = prime * result + total;
		result = prime * result + people;
		result = prime * result + ((year == null) ? 0 : year.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HanRiver other = (HanRiver) obj;
		if (bicycle != other.bicycle)
			return false;
		if (event != other.event)
			return false;
		if (gym != other.gym)
			return false;
		if (park != other.park)
			return false;
		if (region == null) {
			if (other.region != null)
				return false;
		} else if (!region.equals(other.region))
			return false;
		if (total != other.total)
			return false;
		if (people != other.people)
			return false;
		if (year == null) {
			if (other.year != null)
				return false;
		} else if (!year.equals(other.year))
			return false;
		return true;
	}
}
