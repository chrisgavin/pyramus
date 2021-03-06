package fi.otavanopisto.pyramus.rest.model;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Set;

public class Module {

  public Module() {
  }
  
  public Module(Long id, String name, OffsetDateTime created, OffsetDateTime lastModified, String description, Boolean archived, Integer courseNumber,
      Long maxParticipantCount, Long creatorId, Long lastModifierId, Long subjectId, Set<Long> curriculumIds, Double length, Long lengthUnitId, List<String> tags) {
    super();
    this.id = id;
    this.name = name;
    this.created = created;
    this.lastModified = lastModified;
    this.description = description;
    this.archived = archived;
    this.courseNumber = courseNumber;
    this.maxParticipantCount = maxParticipantCount;
    this.creatorId = creatorId;
    this.lastModifierId = lastModifierId;
    this.subjectId = subjectId;
    this.curriculumIds = curriculumIds;
    this.length = length;
    this.lengthUnitId = lengthUnitId;
    this.tags = tags;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public OffsetDateTime getCreated() {
    return created;
  }

  public void setCreated(OffsetDateTime created) {
    this.created = created;
  }

  public OffsetDateTime getLastModified() {
    return lastModified;
  }

  public void setLastModified(OffsetDateTime lastModified) {
    this.lastModified = lastModified;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Boolean getArchived() {
    return archived;
  }

  public void setArchived(Boolean archived) {
    this.archived = archived;
  }

  public Integer getCourseNumber() {
    return courseNumber;
  }

  public void setCourseNumber(Integer courseNumber) {
    this.courseNumber = courseNumber;
  }

  public Long getMaxParticipantCount() {
    return maxParticipantCount;
  }

  public void setMaxParticipantCount(Long maxParticipantCount) {
    this.maxParticipantCount = maxParticipantCount;
  }

  public Long getCreatorId() {
    return creatorId;
  }

  public void setCreatorId(Long creatorId) {
    this.creatorId = creatorId;
  }

  public Long getLastModifierId() {
    return lastModifierId;
  }

  public void setLastModifierId(Long lastModifierId) {
    this.lastModifierId = lastModifierId;
  }

  public Long getSubjectId() {
    return subjectId;
  }
  
  public void setSubjectId(Long subjectId) {
    this.subjectId = subjectId;
  }
  
  public Double getLength() {
    return length;
  }
  
  public void setLength(Double length) {
    this.length = length;
  }
  
  public Long getLengthUnitId() {
    return lengthUnitId;
  }
  
  public void setLengthUnitId(Long lengthUnitId) {
    this.lengthUnitId = lengthUnitId;
  }

  public List<String> getTags() {
    return tags;
  }

  public void setTags(List<String> tags) {
    this.tags = tags;
  }

  public Set<Long> getCurriculumIds() {
    return curriculumIds;
  }

  public void setCurriculumIds(Set<Long> curriculumIds) {
    this.curriculumIds = curriculumIds;
  }

  private Long id;
  private String name;
  private OffsetDateTime created;
  private OffsetDateTime lastModified;
  private String description;
  private Boolean archived;
  private Integer courseNumber;
  private Long maxParticipantCount;
  private Long creatorId;
  private Long lastModifierId;
  private Long subjectId;
  private Double length;
  private Long lengthUnitId;
  private List<String> tags;
  private Set<Long> curriculumIds;
}
