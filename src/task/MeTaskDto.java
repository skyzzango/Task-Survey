package task;

import java.util.List;

public class MeTaskDto {
	private int num;
	private String title;
	private String longTitle;
	private String description;
	private List<String> associated;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLongTitle() {
		return longTitle;
	}

	public void setLongTitle(String longTitle) {
		this.longTitle = longTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<String> getAssociated() {
		return associated;
	}

	public void setAssociated(List<String> associated) {
		this.associated = associated;
	}

	@Override
	public String toString() {
		return "MeTaskDto{" +
				", title='" + title + '\'' +
				", longTitle='" + longTitle + '\'' +
				", description='" + description + '\'' +
				", associated=" + associated +
				'}';
	}
}
